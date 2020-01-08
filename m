Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A381344B5
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 15:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbgAHOMV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 09:12:21 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:57434 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbgAHOMV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 09:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fr9fRlz5jxrgjkeY4j9Bve4Yqtw4Ip+E2iegvsEk9jk=; b=PBzy4YDRvknqyOdLQyAz3OMtm
        VKkkh+lcwJHiQz+AfDbo+JFL3kwsaJHo0GP4eQ8xuTmZMbnDEP1UIVlsYdY9sYN3rs+1rf0xxZbiZ
        uX3ZrF1B8p/4OBrNzTU8JIOyEnxcyNQP+IfxRWacyHfRad6gde1Zo/Gpf56CeHm/wldNEzh8Hmso0
        XfCRsmv1Lov+rld2P3P20MUTPD68Xk90QyZS3/2/tyX9XLhmtQHR77JFpnkYnsibTNaOFMihoeAqR
        zQ51DvLE3lb5zfsz3bVNcIcFgF2uu/bE/q82ktdyTec8YZnpCyVysC1o0iBO3Wtj9V4iO+U8ERZq8
        3wHU2WqDw==;
Received: from 177.206.132.169.dynamic.adsl.gvt.net.br ([177.206.132.169] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ipC4B-0002T4-CD; Wed, 08 Jan 2020 14:12:12 +0000
Date:   Wed, 8 Jan 2020 15:11:57 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        hverkuil@xs4all.nl, gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] media: uapi: hevc: Add scaling matrix control
Message-ID: <20200108151157.17cf9774@kernel.org>
In-Reply-To: <20191213160428.54303-2-jernej.skrabec@siol.net>
References: <20191213160428.54303-1-jernej.skrabec@siol.net>
        <20191213160428.54303-2-jernej.skrabec@siol.net>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 13 Dec 2019 17:04:25 +0100
Jernej Skrabec <jernej.skrabec@siol.net> escreveu:

> HEVC has a scaling matrix concept. Add support for it.

> +struct v4l2_ctrl_hevc_scaling_matrix {
> +	__u8	scaling_list_4x4[6][16];
> +	__u8	scaling_list_8x8[6][64];
> +	__u8	scaling_list_16x16[6][64];
> +	__u8	scaling_list_32x32[2][64];
> +	__u8	scaling_list_dc_coef_16x16[6];
> +	__u8	scaling_list_dc_coef_32x32[2];
> +};

I never looked at HEVC spec, but the above seems really weird.

Please correct me if I am wrong, but each of the above matrixes
is independent, and the driver will use just one of the above on
any specific time (for a given video output node), right?

If so, why would userspace be forced to update lots of matrixes, if would
likely use just one at a given time?

IMO, the proper way would be, instead, to use an uAPI like:

/*
 * Actually, as this is uAPI, we will use a fixed size integer type, like
 *  unsigned int
 */
enum hevc_scaling_matrix_type {
	HEVC_SCALING_MATRIX_4x4,
	HEVC_SCALING_MATRIX_8x8,
...
	HEVC_SCALING_MATRIX_DC_COEF_32x32,
};

struct v4l2_ctrl_hevc_scaling_matrix {
	__u32	scaling_type 		/* as defined by enum hevc_scaling_matrix_type */

	union {
		__u8	scaling_list_4x4[6][16];
		__u8	scaling_list_8x8[6][64];
		__u8	scaling_list_16x16[6][64];
		__u8	scaling_list_32x32[2][64];
		__u8	scaling_list_dc_coef_16x16[6];
		__u8	scaling_list_dc_coef_32x32[2];
	};
};

And let the core use a default for each scaling matrix, if userspace doesn't
set it.



Cheers,
Mauro
