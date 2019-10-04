Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF5B7CB9A8
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 13:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730550AbfJDL7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 07:59:05 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:39255 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726002AbfJDL7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Oct 2019 07:59:05 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id GMEeiwz42jZ8vGMEhitvza; Fri, 04 Oct 2019 13:59:03 +0200
Subject: Re: [PATCH] Documentation:media:v4l2:Add vivid metadata doc
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20191004115514.31259-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3db91bd0-cfdd-6453-6e70-8567ac94d68e@xs4all.nl>
Date:   Fri, 4 Oct 2019 13:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004115514.31259-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF4J9AedAVLEkz+gk7GgRYGWEAbXbWKwx655kOJUSfMLsE9+seMhstIyEKIT0FOfTWlTE0+ea/lCWci9lQKuIZh5ZbNJAakE2b4P0xHRlpF5BFgY/JIT
 SvG4tg3jz6wPo6Ohjm9tjU1JIaIVpjO3PAbsP3lxCsGPjK0JX3CwNgqGWRuT2dIHZzNIqm59T1imwGEUakFTowp2WEoMGEkiHtQ/LfNtuFUtV0ZuuridYfMZ
 dX9HnvnJsAQ146YLYcpPx1nQ8olQXkNacIE6ygjETgo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/4/19 1:55 PM, Vandana BN wrote:
> Adds new file for describing new metadata format V4L2_META_FMT_VIVID added in vivid driver.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  Documentation/media/uapi/v4l/meta-formats.rst |  1 +
>  .../media/uapi/v4l/pixfmt-meta-vivid.rst      | 43 +++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
> 
> diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
> index b10ca9ee3968..74c8659ee9d6 100644
> --- a/Documentation/media/uapi/v4l/meta-formats.rst
> +++ b/Documentation/media/uapi/v4l/meta-formats.rst
> @@ -24,3 +24,4 @@ These formats are used for the :ref:`metadata` interface only.
>      pixfmt-meta-uvc
>      pixfmt-meta-vsp1-hgo
>      pixfmt-meta-vsp1-hgt
> +    pixfmt-meta-vivid
> diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst b/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
> new file mode 100644
> index 000000000000..e6c349fadf30
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
> @@ -0,0 +1,43 @@
> +.. Permission is granted to copy, distribute and/or modify this
> +.. document under the terms of the GNU Free Documentation License,
> +.. Version 1.1 or any later version published by the Free Software
> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
> +.. and no Back-Cover Texts. A copy of the license is included at
> +.. Documentation/media/uapi/fdl-appendix.rst.
> +..
> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
> +
> +.. _v4l2-meta-fmt-vivid:
> +
> +*******************************
> +V4L2_META_FMT_VIVID ('VIVID')

That's a fivecc instead of a fourcc :-)

> +*******************************
> +
> +VIVID Metadata Format
> +
> +
> +Description
> +===========
> +
> +This format describes metadata in vivid driver.

Say: ...describes the metadata format used by the vivid driver.

> +
> +It sets Brightness, Saturation, Contrast and Hue, each of which maps to
> +corresponding control in vivid driver with respect to its range and default values.

...controls of the...
...respect to the range...

> +
> +It contains the following fields:
> +
> +.. flat-table:: VIVID Metadata
> +    :widths: 1 4
> +    :header-rows:  1
> +    :stub-columns: 0
> +
> +    * - Field
> +      - Description
> +    * - u16 brightness;
> +      - Image brightness, value can be in range 0 to 255, with default value as 128.

      - Image brightness, the value is in the range 0 to 255, with the default value as 128.

> +    * - u16 contrast;
> +      - Image contrast, value can be in range 0 to 255, with default value as 128.
> +    * - u16 saturation;
> +      - Image color saturation, value can be in range 0 to 255, with default value as 128.
> +    * - s16 hue;
> +      - Image color balance, value can be in range -128 to 128, with default value as 0.
> 

Ditto.

Regards,

	Hans
