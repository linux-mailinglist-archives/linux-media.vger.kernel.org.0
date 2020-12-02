Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E942CBC93
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 13:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbgLBMN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 07:13:26 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:48131 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729417AbgLBMN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 07:13:26 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kQzukDkjPN7XgkQzyksu9k; Wed, 02 Dec 2020 13:12:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606911163; bh=DXYdVBRGF7jseXC2uIu1D/EW5oYWr4Xwp42Udd5MRQo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lazDUd2DAPzPkZtaQRXBN5+8kMAmNhR22MxqsPtEq2mJR0JOoDkrVJ0xY0ofM5I0a
         64ZcC33c1U/+e55p4rNqHZ1K5uuyNcLmRpYtJpJVM5b6uAyJxZ1X1gtFrgMOb6W2ta
         LHpbHySKI1mXGD4kcK8szkC5tGlhSdPispJ5i1fPqPe2TftyUIlySR+Chv7kzNaVph
         mkNY9dgv97gkTCqT4QZv+C6FXx7IMFRo8PhsXqUnWdKP6hkebxhRroIKwRNphP7XcU
         KylPvlodp4LMqRwcAUod2CnPdPYKx81SKpfyvXOhnG3dwDZxYmh0Hk9aiRns7Jt8xg
         H2mxNxLWcuhBg==
Subject: Re: [PATCH v5 09/10] media: Avoid parsing quantization and huffman
 tables
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
 <20201112030557.8540-10-mirela.rabulea@oss.nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <48b58168-662c-3e4d-2e5d-1f2a14b239fe@xs4all.nl>
Date:   Wed, 2 Dec 2020 13:12:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201112030557.8540-10-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfL5ydNRTlwziOBecZqjZrR9p9r/iDoZaLXFz3otr+eKw/MSd6Kbnsne5FgZEhL4d5PsTho93Wk0LQRL9GtEA0EVb4tu/MS9dQ8bQwyTaAjTqfbqcEwP+
 KbA0yMjtPnBAvRMNJCjL4/OZqNYbXUFlAImjLIQT9VjwqYwJmMOvnFmhshkGnGGqckK7oo2GjRKejAxqNFhEA7YHG2qJnx3Pq3buXvEi//2ZV7wC57uc7V4I
 NtdQD8uzQYRzIRXUdWOZ4qIwhDBI1iACEAmooW7JaVPqtLwwU26GsGt9pikUApr8FIScDJSkV3IvSfw1UOo51nUQstCOaOGMN0iSSRpWla5hpem3LxlYl44W
 pf5iI7Ef1qQHmDhw9d22OKV0YuUOFXdZhfqTOb9iCJe4UKUQ600P5+8cLScS8uj0Dml8MG69Vw0W/HnN+6tXrkchv41DvoePKYACjHKiHPZR8U8HYH2lKVEV
 phKq0GbLDl+RBkHPJ6JMkdUk+IuncuiDD1o6IGuQQ8BJRDdeSrBBSOjoTlZ0WOd4as+4vpctxWF2HuXeCVa8yAAchoU+92p0WY4DwSCs+l/bgfT7lRuEvxGZ
 5pYjwpDbjSRWoOpWdpBHCsMGld23Itchp0DYpGhYKnMGpSYEfhLYlQ+vm2xm8QYsgkGmuaGmPS+iInp/7eHpHTm/koiAZCx6OSqWYR16qXFESUoENhBAKLav
 F5TMsk2qflM9JiOWvVZu2l1gKxr4Q4vFWt5RxD+cvWpEB62T/UEQNCSBHWrAUWeX9kFsWjhrWv51azuRpCLUD/VMEkf84NKy6lliz11Lc3YRODlnh83yiQvw
 Ehq7aubitDh7z6PAay5/n05J7wd4e+wgAKU5+N95pq8+oimAJyzeoP90acRQHcf1mYpcMzL/nBRNtUQp7CQLt6O8HjWeSlfohVWh1h5cm+TUccUEPRebFo0o
 /Vuwig==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/11/2020 04:05, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> These are optional in struct v4l2_jpeg_header, so do not parse if
> not requested, save some time.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-jpeg.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
> index d77e04083d57..7576cd0ce6b9 100644
> --- a/drivers/media/v4l2-core/v4l2-jpeg.c
> +++ b/drivers/media/v4l2-core/v4l2-jpeg.c
> @@ -307,6 +307,9 @@ static int jpeg_parse_quantization_tables(struct jpeg_stream *stream,
>  {
>  	int len = jpeg_get_word_be(stream);
>  
> +	if (!tables)
> +		return 0;
> +

It feels more natural to check for a non-NULL out->quantization_tables
or non-NULL out->huffman_tables pointer in v4l2_jpeg_parse_header()
rather than in these low-level functions. It's weird to have this check here.

Regards,

	Hans

>  	if (len < 0)
>  		return len;
>  	/* Lq = 2 + n * 65 (for baseline DCT), n >= 1 */
> @@ -361,6 +364,9 @@ static int jpeg_parse_huffman_tables(struct jpeg_stream *stream,
>  	int mt;
>  	int len = jpeg_get_word_be(stream);
>  
> +	if (!tables)
> +		return 0;
> +
>  	if (len < 0)
>  		return len;
>  	/* Table B.5 - Huffman table specification parameter sizes and values */
> 

