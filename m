Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE0A30A8F3
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 14:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbhBANk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 08:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbhBANk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 08:40:56 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65EDC061573;
        Mon,  1 Feb 2021 05:40:15 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dbd4xkyj7wcfw2k22jcct-3.rev.dnainternet.fi [IPv6:2001:14ba:8f1:3400:fb90:892b:22d6:3885])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id DB8BD1B0039A;
        Mon,  1 Feb 2021 15:40:10 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1612186811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OkI1JNtw0Xal9WHkoR/QpG6O9dg+7qJWczM5eRfGy7g=;
        b=NONgVykmpdi7vvXK2PO4MjqG0OKypiZPV+ty4N01GBLCG4iy2h4fQjbZ9BE8WfCgcyFtqc
        2n9T28JJGegO2qLTvcQADL4bILhyiPKp9TeGtnf6V7+BhERZRNGftimewd1l3gxW3PSQ/K
        v3y0+5tgpE90Y1zZCJAEciscT+E5GKdXQRwF5ezIRqBH8ajYyjUTuDOj/2osenI/uC00k4
        KVfbxGrK5iltbFX+P8+44Kbj1c70XBPVRVC0fsxPH4Fm8p3hfH+aW8BlZMm45SaXnpoZQp
        6wINeSuaQMOLuOU52LUX5Y3adSes/T/+XmV8BOjIcSIW2NxN8mjsZ/Y+IDjfWA==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B63A6634C92;
        Mon,  1 Feb 2021 15:39:55 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l6ZR1-0000hG-Tn; Mon, 01 Feb 2021 15:40:07 +0200
Date:   Mon, 1 Feb 2021 15:40:07 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, shawnguo@kernel.org, leoyang.li@nxp.com,
        geert+renesas@glider.be, arnd@arndb.de, Anson.Huang@nxp.com,
        michael@walle.cc, agx@sigxcpu.org, max.oss.09@gmail.com,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v3 10/22] media: camss: Add support for CSIPHY hardware
 version Titan 170
Message-ID: <20210201134007.GE3@valkosipuli.retiisi.org.uk>
References: <20210127144930.2158242-1-robert.foss@linaro.org>
 <20210127144930.2158242-11-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127144930.2158242-11-robert.foss@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1612186811; a=rsa-sha256;
        cv=none;
        b=RyJQBLcGrJOWPEu11MLWf1AV/oztOT08Kz2Dlya9hefcHpvFLZo5b8SDGG7YjfPZO87eT1
        QEnEzauOPfXiiTijuivyMbE3jG3OYHblOngw27Xj4Vf6h24Rpvf7QgBhq5rYng5iO+Cmhu
        0VQE87Z7Seks7IUJq6frZSSg3A0uBMwVpzRmV59QNjjQmO3pp4s1YwVROkagoi0+Kx1xB7
        2s10C0J+qYa2c0nYmKekWMGOxlTzYNJqnmJUP9pWAosS6+VRC8VxOcZhnPm2LfwxIGOq+s
        /L4lk5poUEJqsHs6YEtl8gvYSQL3zH/TE9LEPHUqXIqWr7+tbGUxEPyYqPTMTQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1612186811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OkI1JNtw0Xal9WHkoR/QpG6O9dg+7qJWczM5eRfGy7g=;
        b=LlPD+zgot2cSVqfLenc/LZaVyiQN7fGYOOhE+DChsJgMr6iMrj/DMIl8VZrVmRjjBmfRyz
        QoAPyBpC8Bq0CyfbxJva+HU+O92v0kk78GdQZFnpPvu5YUEyAL1vt+ejSUABB1/5xCFE/q
        sc/7yEifKWGje9LrBjPa+RsTpRP59a2W9xovihjctQWdR85DVvaP9kEEw6U58TkOXX8Lhc
        Ee/tZdJzsIB2DWYgSZnG0NVqIebJ4WBk2wrko5b0bFJTHizKdoFe5c8JbaZJFGaMQOYmd5
        ciSN7Ccg4utoXlCsFXrIDCfLW3CM7k43NR9f3gQiAgJZxf7qz5pV/jLOY/y1/g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Wed, Jan 27, 2021 at 03:49:18PM +0100, Robert Foss wrote:
> Add register definitions for version 170 of the Titan architecture
> and implement support for the CSIPHY subdevice.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         | 182 ++++++++++++++++--
>  .../media/platform/qcom/camss/camss-csiphy.c  |  66 +++++--
>  drivers/media/platform/qcom/camss/camss.c     |  74 +++++++
>  3 files changed, 290 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 97cb9de85031..8cf1440b7d70 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -47,6 +47,105 @@
>  #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
>  #define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(n)	(0x8b0 + 0x4 * (n))
>  
> +#define CSIPHY_DEFAULT_PARAMS            0
> +#define CSIPHY_LANE_ENABLE               1
> +#define CSIPHY_SETTLE_CNT_LOWER_BYTE     2
> +#define CSIPHY_SETTLE_CNT_HIGHER_BYTE    3
> +#define CSIPHY_DNP_PARAMS                4
> +#define CSIPHY_2PH_REGS                  5
> +#define CSIPHY_3PH_REGS                  6
> +
> +struct csiphy_reg_t {
> +	int32_t  reg_addr;
> +	int32_t  reg_data;
> +	int32_t  delay;
> +	uint32_t csiphy_param_type;
> +};
> +
> +static struct

This should be const.

> +csiphy_reg_t lane_regs_sdm845[5][14] = {
> +	{
> +		{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0000, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0008, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x000c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0708, 0x14, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x070C, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0764, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0200, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0208, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x020C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0264, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0400, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0408, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x040C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0600, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0608, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x060C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +};

-- 
Sakari Ailus
