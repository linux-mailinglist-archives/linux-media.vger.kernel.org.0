Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E215318C2F8
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgCSW1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:27:52 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51428 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgCSW1w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:27:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMRnwa111524;
        Thu, 19 Mar 2020 17:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584656869;
        bh=o9qTfrNyTrvUYlFAtuA4GHJzze/xHQCe5Nt46tnaKqo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=njLijwT+JCxaHa4pnJvWrd7B+xztrc/nCGYTM+DE7nKUvy4hV+/UIw9fhiUCVjlyA
         VYPETB0elHK98SJk4zhPVSt3nNuICd1ZzKkfRqVMWWgEhx2My/J3k6I76cgYpxwoBU
         /fmArjlwd9m09CGLd6muL9BsB3GXLPGJrsUupUHk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMRntr100457
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:27:49 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:27:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:27:48 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMRmxA028128;
        Thu, 19 Mar 2020 17:27:48 -0500
Subject: Re: [PATCH v2 03/19] media: ti-vpe: cal: fix use of wrong macro
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-4-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <ddcafd67-182b-8d54-7e3f-2c2853518122@ti.com>
Date:   Thu, 19 Mar 2020 17:27:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-4-tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomi,

Thanks for the patch.

On 3/19/20 2:50 AM, Tomi Valkeinen wrote:
> i913_errata() sets a bit to 1 in PHY_REG10, but for some reason uses
> CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE for the bit value. The value of
> that macro is 1, so it works, but is still wrong.
> 
> Fix this to 1.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 76d55c76d938..c418296df0f8 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -645,8 +645,7 @@ static void i913_errata(struct cal_dev *dev, unsigned int port)
>  {
>  	u32 reg10 = reg_read(dev->cc[port], CAL_CSI2_PHY_REG10);
>  
> -	set_field(&reg10, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
> -		  CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
> +	set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
>  
>  	cal_dbg(1, dev, "CSI2_%d_REG10 = 0x%08x\n", port, reg10);
>  	reg_write(dev->cc[port], CAL_CSI2_PHY_REG10, reg10);
> 
