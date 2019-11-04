Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72E38EE645
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 18:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729416AbfKDRkb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 12:40:31 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:60036 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728322AbfKDRkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 12:40:31 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4HeUWx123574;
        Mon, 4 Nov 2019 11:40:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572889230;
        bh=sbqGTbYH8HR2luBATg54HOuIFYghy2cWOBeTXsca/zU=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Qa6ALll7R7M+BhqiCBxuq59m8HPnFY1DxPQAndMaVx0FCDiSDivw49h8t9p0FVbvP
         QDStKk7dZecY3EEtwwQEiMA1Li8sY/JVtExGKrBKFz97wiL6jLibs4Arlu46GTmVoS
         vPYF+7bM87BEUvriG4zASbVTI9CAJs/TpUbRlp/4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4HeMfB123164
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 11:40:23 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 11:40:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 11:40:08 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id xA4HeMXe020669;
        Mon, 4 Nov 2019 11:40:22 -0600
Date:   Mon, 4 Nov 2019 11:40:22 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/8] am437x: fix smatch warning
Message-ID: <20191104174022.7yfv5liqiozxqsgu@ti.com>
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
 <20191103112338.22569-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191103112338.22569-2-hverkuil-cisco@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote on Sun [2019-Nov-03 12:23:31 +0100]:
> Fixes this warning:
> 
> drivers/media/platform/am437x/am437x-vpfe.c:288 vpfe_ccdc_validate_param() warn: unsigned 'ccdcparam->alaw.gamma_wd' is never less than zero.
> 
> by dropping the gamma_wd < VPFE_CCDC_GAMMA_BITS_15_6 check
> since VPFE_CCDC_GAMMA_BITS_15_6 is 0.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 447610b67db4..09104304bd06 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -285,7 +285,6 @@ vpfe_ccdc_validate_param(struct vpfe_ccdc *ccdc,
>  	max_data = ccdc_data_size_max_bit(ccdcparam->data_sz);
>  
>  	if (ccdcparam->alaw.gamma_wd > VPFE_CCDC_GAMMA_BITS_09_0 ||
> -	    ccdcparam->alaw.gamma_wd < VPFE_CCDC_GAMMA_BITS_15_6 ||
>  	    max_gamma > max_data) {

Reviewed-by: Benoit Parrot <bparrot@ti.com>

>  		vpfe_dbg(1, vpfe, "Invalid data line select\n");
>  		return -EINVAL;
> -- 
> 2.23.0
> 
