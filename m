Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5D133D0ED
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 10:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236341AbhCPJhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 05:37:22 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:58883 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233767AbhCPJg7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 05:36:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M689l0xHB4ywlM68ClAQKM; Tue, 16 Mar 2021 10:36:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615887414; bh=tXVjtYh1qnWCnzH2zsvVfBAb1dwXEkt7WykZMDscd0g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Vqeg0QMruN2ertgROZvDzgwFCJD5NkqOolPXdB0JzmPlZ1ibLK2RMeDDqgJwQIqCL
         1kJwtQjb4SrE4PoHdR9YP3X1/LpqopO8Gmuu/N+uH8ody9pu0PG7oKcHgk3O+tT+/O
         bXAOcFNM8hpwwdHeaQ4L5TsNH/jxd0Evb0Oxu9TxyyShX5L/KZsOy8ci2RmM3RyH5y
         EfYzUCk/ZhaZtzNYYKhvpO8eIJwuVDRQ+4h7VsEuLvqBHSxkwN/mrgQSEX4jn//U/0
         iQhPhqwIW3mlevBOOj24nI2KmEDtpu1tYULAQrppIdpYUmLME0ajxGdudkb3tviFPf
         a5nwNOwincidA==
Subject: Re: [PATCH v8 09/22] media: camss: Refactor CSID HW version support
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210315155942.640889-1-robert.foss@linaro.org>
 <20210315155942.640889-10-robert.foss@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b06ce7af-4449-fb5c-2920-09ebd5abdf75@xs4all.nl>
Date:   Tue, 16 Mar 2021 10:36:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210315155942.640889-10-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIIjDYU6ZSNsWIq/dGepkDOYuBFz5jmx0QUTXx/K5ZFzVU5BHm97pmEZrW5J2Lmq3pkNDvG+tfqlVC+syz+8IKixMCRzzq2WXE1AZRLoGUZ50gDC5VEs
 wjPSKVFUX6+LLYCM3ZiGYMuXx6qLh6jlYoJrC/zp9t99DhIX0ASwkVxImXjHfHitmx0qy+ZIm3UGrsjOwsNBmxjL9ChPrjq1t/sK51+npe+2KJ0cnPbmcRn8
 geO74YRD0VFwP4kji31g8NKkIk+eEU37niqPVa/nObORLOUIs+iTQ9XA2oxyMxN3RVo26MKrshMdnGnV/53tTu4JxHr/NDPi6YgyEhEezFdM1Jm1n19qFM60
 q4XVdZi4b4QJthx6eIqU4tRsyqPadyedm9VBzRmhoRjT5jOPv9h4QXrPAQbdz8+YP29QXX1fyrkhc8KycY0Em0/s9ys7zBZPlUhmyMi3TWBqvsju2+CTt2N4
 TIvqkr3hUdTVNVTfZ/pZbtZZuBpkc+WoN+SknyAjXKQpGcCZR62zBUHqG3h8UZMseyI9kp6rPC25dbOZBSzBkrJd4l5FmtH5JvX9N9g1DJ6i3RrS12zZ3x66
 neaWYFmnZx6et77t75235RM0xaJ86bjM94NESit16QDFDXzrDKsKuIT+AAf01eIKM5x34dmPjDKz9V7H8ZWdz6Ev4lDkQpFwVjbRKemb+1+zVcDi32I3ek1g
 axnvczdEcAe/yNzpiqa/wLTqOIOfV+i1Zf7LDnsJKvr0PYh0eWZL6pkPSA/nPoy/tpbt0svcFM6J+48qk/QqXNicJGf1hrCd3NEnElmrtpw2SV2eIG5x9Ten
 O/5fsLH2Oe5zFbXd8VtCtiiRsoVSSTUxE3NkaSDlN37/A6GQftv5sAWxCktjfA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/03/2021 16:59, Robert Foss wrote:
> In order to support Qualcomm ISP hardware architectures that diverge
> from older architectures, the CSID subdevice drivers needs to be refactored
> to better abstract the different ISP hardware architectures.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
> 
> 
> Changes since v1:
>  - kernel test robot: Add missing include, interrupt.h
> 
> Changes since v4:
>  - Andrey: Removed whitespace from some includes
>  - Andrey: Removed unused enum
> 
> Changes since v5:
>  - Andrey: Fixed test pattern selection logic
>  - Andrey: Align test mode enum values with v4l mode selection return values
>  - Andrey: r-b
>  - Move Titan 170 test modes to the the Titan 170 commit
>  - Fixed test pattern boundary check
> 
> Changes since v7:
>  - Hans: Fix checkpatch.pl --strict warnings
> 
> 
> 
>  drivers/media/platform/qcom/camss/Makefile    |   2 +
>  .../platform/qcom/camss/camss-csid-4-1.c      | 328 ++++++++++
>  .../platform/qcom/camss/camss-csid-4-7.c      | 404 ++++++++++++
>  .../media/platform/qcom/camss/camss-csid.c    | 608 +-----------------
>  .../media/platform/qcom/camss/camss-csid.h    | 129 +++-
>  5 files changed, 885 insertions(+), 586 deletions(-)
>  create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
>  create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c
> 

<snip>

> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 479ac1f83836..613ef377b051 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -11,6 +11,7 @@
>  #define QC_MSM_CAMSS_CSID_H
>  
>  #include <linux/clk.h>
> +#include <linux/interrupt.h>
>  #include <media/media-entity.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -44,18 +45,42 @@
>  #define DATA_TYPE_RAW_16BIT		0x2e
>  #define DATA_TYPE_RAW_20BIT		0x2f
>  
> -enum csid_payload_mode {
> -	CSID_PAYLOAD_MODE_INCREMENTING = 0,
> -	CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 1,
> -	CSID_PAYLOAD_MODE_ALL_ZEROES = 2,
> -	CSID_PAYLOAD_MODE_ALL_ONES = 3,
> -	CSID_PAYLOAD_MODE_RANDOM = 4,
> -	CSID_PAYLOAD_MODE_USER_SPECIFIED = 5,
> +#define CSID_RESET_TIMEOUT_MS 500
> +
> +enum csid_testgen_mode {
> +	CSID_PAYLOAD_MODE_DISABLED = 0,
> +	CSID_PAYLOAD_MODE_INCREMENTING = 1,
> +	CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 2,
> +	CSID_PAYLOAD_MODE_ALL_ZEROES = 3,
> +	CSID_PAYLOAD_MODE_ALL_ONES = 4,
> +	CSID_PAYLOAD_MODE_RANDOM = 5,
> +	CSID_PAYLOAD_MODE_USER_SPECIFIED = 6,
> +	CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 6, /* excluding disabled */
> +};
> +
> +static const char * const csid_testgen_modes[] = {
> +	"Disabled",
> +	"Incrementing",
> +	"Alternating 0x55/0xAA",
> +	"All Zeros 0x00",
> +	"All Ones 0xFF",
> +	"Pseudo-random Data",
> +	"User Specified",
> +};

This gives this sparse warning:

'csid_testgen_modes' defined but not used [-Wunused-const-variable=]

This array needs to be moved to camss-csid.c and declared as an extern
here. Also, this menu array needs to be terminated with a NULL, and the
right capitalization needs to be used (first character of each word must
be a capital). This is a suggested patch I made to verify that this solves
this issue, but really both patch 9 and 10 need to be modified.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 14 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h | 13 +------------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index fb94dc03ccd4..1513b3d47fc2 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -27,6 +27,20 @@

 #define MSM_CSID_NAME "msm_csid"

+const char * const csid_testgen_modes[] = {
+	"Disabled",
+	"Incrementing",
+	"Alternating 0x55/0xAA",
+	"All Zeros 0x00",
+	"All Ones 0xFF",
+	"Pseudo-Random Data",
+	"User Specified",
+	"Complex Pattern",
+	"Color Box",
+	"Color Bars",
+	NULL
+};
+
 u32 csid_find_code(u32 *codes, unsigned int ncodes,
 		   unsigned int match_format_idx, u32 match_code)
 {
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index c2a025f6846b..81a3704ac0e3 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -62,18 +62,7 @@ enum csid_testgen_mode {
 	CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2 = 9, /* excluding disabled */
 };

-static const char * const csid_testgen_modes[] = {
-	"Disabled",
-	"Incrementing",
-	"Alternating 0x55/0xAA",
-	"All Zeros 0x00",
-	"All Ones 0xFF",
-	"Pseudo-random Data",
-	"User Specified",
-	"Complex pattern",
-	"Color box",
-	"Color bars",
-};
+extern const char * const csid_testgen_modes[];

 struct csid_format {
 	u32 code;
-- 
2.30.1

Regards,

	Hans
