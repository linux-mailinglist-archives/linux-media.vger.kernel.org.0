Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1409A345ADF
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 10:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhCWJbr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 05:31:47 -0400
Received: from mout01.posteo.de ([185.67.36.65]:35890 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229884AbhCWJbY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 05:31:24 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id C8231160066
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 10:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1616491880; bh=dit+45EQ+3zsRHyLFosn8D1hh9J/iWbbpD8daIMWHTA=;
        h=Date:From:To:Cc:Subject:From;
        b=qx0hMpbiFlvPpkpTJD4LsIZKk2wTIs3wZ0JVI8Dqdhru+gHPZGbjKoeLgX3W4mo6f
         8piTeTF01Kz+oiRuRKjx4FPuuCwDXxnixeEHX6KRXi0QT88giY4i0+ilqrgJkHov4A
         uL3i4VcabwQWZYnQwNJkMDn+/ZeylarSmMlyOr0aiTWXxEgp26zLd2wWRriEXGi96L
         reRUd/qpSi8buzDqYDb66gX6eskE7DztWzqOReyJd0Zse9WadZKQzLEGumqbk0NnUi
         jpXi7GjgKIGRgDvVkrLdtvIjep78TdM+AVfakhzcsC0Gj2wgSqNd93hclud9fLXw3G
         d7qUM1MUyQlhQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4F4R2H3Zztz9rxX;
        Tue, 23 Mar 2021 10:31:19 +0100 (CET)
Date:   Tue, 23 Mar 2021 10:31:18 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com, tfiga@chromium.org
Subject: Re: [PATCH] media: rkisp1: uapi: document which flags/structs relate
 to statistics config
Message-ID: <20210323093118.hwomifhpxs2gs74z@basti-TUXEDO-Book-XA1510>
References: <20210323092211.19230-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20210323092211.19230-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Dafna,

Thanks a lot for this change.
This will certainly help for the task of writing the IPAs in libcamera.

If you like you can add:
Reviewed-by: Sebastian Fricke <sebastian.fricke@posteo.net>

On 23.03.2021 10:22, Dafna Hirschfeld wrote:
>Add a documentation to tell which flags and structs are

I would rather write:
s/Add a documentation to tell/Modify the documentation to point out/

>used to configure the statistics.
>
>Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>---
> include/uapi/linux/rkisp1-config.h | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>index 36e3efb81b01..8d1f8bd192fc 100644
>--- a/include/uapi/linux/rkisp1-config.h
>+++ b/include/uapi/linux/rkisp1-config.h
>@@ -15,7 +15,7 @@
> #define RKISP1_CIF_ISP_MODULE_BLS		(1U << 1)
> /* Sensor De-gamma */
> #define RKISP1_CIF_ISP_MODULE_SDG		(1U << 2)
>-/* Histogram */
>+/* Histogram statistics configuration */
> #define RKISP1_CIF_ISP_MODULE_HST		(1U << 3)
> /* Lens Shade Control */
> #define RKISP1_CIF_ISP_MODULE_LSC		(1U << 4)
>@@ -31,13 +31,13 @@
> #define RKISP1_CIF_ISP_MODULE_GOC		(1U << 9)
> /* Color Processing */
> #define RKISP1_CIF_ISP_MODULE_CPROC		(1U << 10)
>-/* Auto Focus Control */
>+/* Auto Focus Control statistics configuration */
> #define RKISP1_CIF_ISP_MODULE_AFC		(1U << 11)
>-/* Auto White Balancing */
>+/* Auto White Balancing statistics configuration */
> #define RKISP1_CIF_ISP_MODULE_AWB		(1U << 12)
> /* Image Effect */
> #define RKISP1_CIF_ISP_MODULE_IE		(1U << 13)
>-/* Auto Exposure Control */
>+/* Auto Exposure Control statistics Configuration */

In order to align with the other comments:
s/Configuration/configuration/

> #define RKISP1_CIF_ISP_MODULE_AEC		(1U << 14)
> /* Wide Dynamic Range */
> #define RKISP1_CIF_ISP_MODULE_WDR		(1U << 15)
>@@ -411,7 +411,7 @@ struct rkisp1_cif_isp_cproc_config {
> };
>
> /**
>- * struct rkisp1_cif_isp_awb_meas_config - Configuration used by auto white balance
>+ * struct rkisp1_cif_isp_awb_meas_config - Configuration for the AWB statistics
>  *
>  * @awb_mode: the awb meas mode. From enum rkisp1_cif_isp_awb_mode_type.
>  * @awb_wnd: white balance measurement window (in pixels)
>@@ -550,7 +550,7 @@ struct rkisp1_cif_isp_goc_config {
> };
>
> /**
>- * struct rkisp1_cif_isp_hst_config - Configuration used by Histogram
>+ * struct rkisp1_cif_isp_hst_config - Configuration for Histogram statistics
>  *
>  * @mode: histogram mode (from enum rkisp1_cif_isp_histogram_mode)
>  * @histogram_predivider: process every stepsize pixel, all other pixels are
>@@ -575,7 +575,7 @@ struct rkisp1_cif_isp_hst_config {
> };
>
> /**
>- * struct rkisp1_cif_isp_aec_config - Configuration used by Auto Exposure Control
>+ * struct rkisp1_cif_isp_aec_config - Configuration for Auto Exposure statistics
>  *
>  * @mode: Exposure measure mode (from enum rkisp1_cif_isp_exp_meas_mode)
>  * @autostop: stop mode (from enum rkisp1_cif_isp_exp_ctrl_autostop)
>@@ -588,7 +588,7 @@ struct rkisp1_cif_isp_aec_config {
> };
>
> /**
>- * struct rkisp1_cif_isp_afc_config - Configuration used by Auto Focus Control
>+ * struct rkisp1_cif_isp_afc_config - Configuration for the Auto Focus statistics
>  *
>  * @num_afm_win: max RKISP1_CIF_ISP_AFM_MAX_WINDOWS
>  * @afm_win: coordinates of the meas window
>-- 
>2.17.1

Greetings,
Sebastian

>
