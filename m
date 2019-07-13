Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D51567983
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2019 11:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfGMJnN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jul 2019 05:43:13 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:52061 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726448AbfGMJnN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jul 2019 05:43:13 -0400
Received: from [IPv6:2001:983:e9a7:1:50a4:f359:1bdf:8a15] ([IPv6:2001:983:e9a7:1:50a4:f359:1bdf:8a15])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mEYghQgecuEBxmEYhhGhaz; Sat, 13 Jul 2019 11:43:11 +0200
Subject: Re: [PATCH] edid-decode: add support for DD+ JOC flags
To:     rawoul@gmail.com, linux-media@vger.kernel.org
References: <20190712160131.13578-1-rawoul@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <efc17d9b-cc75-e6ce-d267-cf84c3a790a4@xs4all.nl>
Date:   Sat, 13 Jul 2019 11:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190712160131.13578-1-rawoul@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFF0StrdiaFmq+g+bXOqjH6GQuqq/vj4DdyyCliaJ0VA9fMH/d0UMZ+5w94OhkbI4nMz9gdmOsejeMK80mRI24fcaJs8+Nd3EsKYMCAu/+kyEK2OvUYP
 i67BcEfFWz9q1pjVD2MAp7tmdM+DZ5AdO7jgOq3AfL6JAblHy3dnqTeWgPWklZUPfvR+t1M4G6qF9OsYOa1D/vwCKpAFPH2Oc5UhI0vy26467tXC4DZCXtLo
 yljNnyjOX4uhvXdMT7NwFX9BS6l/kswFnH9z5w8AzabOFbsuWPX9HQFaBYF3IB+GR4b0NO3oF7JEBGmgewA2Xw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnaud,

On 7/12/19 6:01 PM, rawoul@gmail.com wrote:
> From: Arnaud Vrac <avrac@freebox.fr>
> 
> Used to signal Joint Object Coding support, used in particular for
> Atmos streams.

Do you have a link to some reference that documents these audio bits?

Or at minimum the name of the reference document. I'd like to at least
document where this information comes from.

Thanks,

	Hans

> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>  edid-decode.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/edid-decode.c b/edid-decode.c
> index 940bcb5..197b78d 100644
> --- a/edid-decode.c
> +++ b/edid-decode.c
> @@ -1165,6 +1165,11 @@ static void cta_audio_block(const unsigned char *x, unsigned int length)
>  			       (x[i+2] & 0x01) ? " 16" : "");
>  		} else if (format <= 8) {
>  			printf("      Maximum bit rate: %d kb/s\n", x[i+2] * 8);
> +		} else if (format == 10) {
> +			if(x[i+2] & 1)
> +				printf("      Supports JOC\n");
> +			if(x[i+2] & 2)
> +				printf("      Supports JOC with ACMOD28\n");
>  		} else if (format == 14) {
>  			printf("      Profile: %d\n", x[i+2] & 7);
>  		} else if (ext_format == 11 && (x[i+2] & 1)) {
> 

