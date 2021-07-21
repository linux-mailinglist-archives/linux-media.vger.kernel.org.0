Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D03E3D0D5B
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 13:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237824AbhGUKkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 06:40:37 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57447 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238670AbhGUJ3B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 05:29:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 69AOm0z7khqx969APmyaYO; Wed, 21 Jul 2021 12:09:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626862170; bh=P3eSTRr/wwYYDeWXMLnHYx2UOIc+mSdyH5PzEnuByEY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OkOaoVs/4g8kNSUCw37Tt0XZFmJc1NSd9ubjTJ8iC4J/H3ekTo27b+cpq6u1RoQYF
         BxVssIEpzTCW8a/Jg0GJn7v/Rfe7ZCfO1OYz6CbqTZXkms5id4YnBKGpZ1WIzGcnxU
         /Artg1iefLlXNQA1H7VB6YtNnDwfRlS1C6vz1S4sMxjBGIUGpUhdX8I8T6qtnhfKgU
         22RdGUYMo+avZrRxfyr9uwPI1hGHulKqhgWbOl0323vyNmU9FxxnsOK42sLc+kL2TH
         qMd+km0BUZ+xf2TJ0J9qfMlPHiDf4geAc0ls/LSxNJd9yBfNnM/K51gwxbviFQ9d1o
         iBnpoHyvKVShA==
Subject: Re: [PATCH v4 02/13] media: v4l: add some definition of v4l2
 colorspace/xfer_func/ycbcr_encoding
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        aisheng.dong@nxp.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1626743758.git.ming.qian@nxp.com>
 <d63b34381eec0ae47bf39dd2b88d2bc8994c269d.1626743758.git.ming.qian@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <449dc223-d248-8771-2f5a-46c6bbac401d@xs4all.nl>
Date:   Wed, 21 Jul 2021 12:09:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d63b34381eec0ae47bf39dd2b88d2bc8994c269d.1626743758.git.ming.qian@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPV0SKw09O60/fU+QSqBVSheTtwmeqte4y+S0hj61q1Dxc5peWOif0typ/U0Hu+/OFSUlfd96wjKqttELUA2rAFV5d+IFLtA+GN3S6OZ8MGSZJtlZojs
 xnlulVR5YyjgMn8aoYJRs5ltgBEcvoBWEqisGTr6s68B2/zuBF6j8IjWXfoLGlOdx4vP1Yi1FSQljNx7ZypPb8+Zm4O07UcOqRAkN6tHv4R7c5UBULyj1Zk+
 fXxqMZzRxuUaLMeRA97Todjr8uhpkzBvbzaHKZvpHlt1Z+rl/3uCJ2pg4dep4lSJfC+74whEJXsnxPAU/zwEEcE+h+PzziC4xNHTj+xZiJM24mdKgwP7TfAp
 AU1NpUcRiiOAv5GX77DhbixopUqtdAzPokRpdloqjv8vKtNUEQtQSbyqN5iH34PGqPrvMHJ9qniyDfgbiZ45eUrYCtiC7EoLUElT6usTAeAmzBp7OJFADDEQ
 nvSSwkIs6DhuhlWxoOTBJ5lsEIsJC4PYC/eMXPcOPudpfXUhiI4okPUKSnqdDECbuSmLipN/p5v7jNd9VxAVZMZRWPeGHbxzmyDAUBGiRiZkyC+LaG6g0a2e
 bGh0+3NtoXEGFlq6kIXyh6sdYmteTXYhFA8PgQ3/sAwkFmYTpKZ6c1zb8zvGd24aECIj2XcTIWF78vSLXqa97PjntEkCgrfwougtm/Kg1PAXWUr58m5iXtJ3
 8f4WJZM3hPw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/07/2021 03:43, Ming Qian wrote:
> Some definition of colorspace/xfer_func/ycbcr_encoding
> are defined in ISO, but missed in V4L2,
> so add some definition according VPU driver's requirement
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> ---
>  include/uapi/linux/videodev2.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 534eaa4d39bc..545f2c329bc9 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -247,6 +247,12 @@ enum v4l2_colorspace {
>  
>  	/* DCI-P3 colorspace, used by cinema projectors */
>  	V4L2_COLORSPACE_DCI_P3        = 12,
> +
> +	/* Generic film (colour filters using Illuminant C) */
> +	V4L2_COLORSPACE_GENERIC_FILM  = 13,
> +
> +	/* SMPTE ST 428-1 */
> +	V4L2_COLORSPACE_ST428         = 14,
>  };
>  
>  /*
> @@ -276,6 +282,20 @@ enum v4l2_xfer_func {
>  	 * V4L2_COLORSPACE_RAW: V4L2_XFER_FUNC_NONE
>  	 *
>  	 * V4L2_COLORSPACE_DCI_P3: V4L2_XFER_FUNC_DCI_P3
> +	 *
> +	 * V4L2_XFER_FUNC_LINEAR: Linear transfer characteristics

This exists already: V4L2_XFER_FUNC_NONE

> +	 *
> +	 * V4L2_XFER_FUNC_GAMMA22: Assumed display gamma 2.2
> +	 *
> +	 * V4L2_XFER_FUNC_GAMMA28: Assumed display gamma 2.8
> +	 *
> +	 * V4L2_XFER_FUNC_HLG: STD-B67, Rec. ITU-R BT.2100-2 hybrid-log-gamma
> +	 *
> +	 * V4L2_XFER_FUNC_XVYCC: IEC 61966-2-4

This exists already, it is signaled through V4L2_YCBCR_ENC_XV709 and
V4L2_YCBCR_ENC_XV601. It's not actually a different transfer function,
it's the YCbCr encoding that's different (the transfer function is still
V4L2_XFER_FUNC_709).

> +	 *
> +	 * V4L2_XFER_FUNC_BT1361: Rec. ITU-R BT.1361-0 extended colour gamut
> +	 *
> +	 * V4L2_XFER_FUNC_ST428: SMPTE ST 428-1
>  	 */
>  	V4L2_XFER_FUNC_DEFAULT     = 0,
>  	V4L2_XFER_FUNC_709         = 1,
> @@ -285,6 +305,13 @@ enum v4l2_xfer_func {
>  	V4L2_XFER_FUNC_NONE        = 5,
>  	V4L2_XFER_FUNC_DCI_P3      = 6,
>  	V4L2_XFER_FUNC_SMPTE2084   = 7,
> +	V4L2_XFER_FUNC_LINEAR      = 8,
> +	V4L2_XFER_FUNC_GAMMA22     = 9,
> +	V4L2_XFER_FUNC_GAMMA28     = 10,
> +	V4L2_XFER_FUNC_HLG         = 11,
> +	V4L2_XFER_FUNC_XVYCC       = 12,
> +	V4L2_XFER_FUNC_BT1361      = 13,

This appears to be a variant of xvYCC, it should probably be a YCBCR_ENC variant
since the transfer function defined in bt.1361 is REC709.

> +	V4L2_XFER_FUNC_ST428       = 14,

Not sure what this one is about.

>  };
>  
>  /*
> @@ -345,6 +372,9 @@ enum v4l2_ycbcr_encoding {
>  
>  	/* SMPTE 240M -- Obsolete HDTV */
>  	V4L2_YCBCR_ENC_SMPTE240M      = 8,
> +
> +	/* KR=0.30, KB=0.11 or equivalent */
> +	V4L2_YCBCR_ENC_BT470_6M       = 9,
>  };
>  
>  /*
> 

I'm not opposed to this, but it has to be documented in
Documentation/userspace-api/media/v4l/colorspaces-details.rst.

I would recommend for an initial submission to only add those new colorimetries
that are actually needed, and others can be added later. uAPI additions take a
lot of time, esp. getting the documentation correct.

Regards,

	Hans
