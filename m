Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A226D241B3A
	for <lists+linux-media@lfdr.de>; Tue, 11 Aug 2020 14:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgHKM54 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 08:57:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45784 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbgHKM5y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 08:57:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07BCvne9035021;
        Tue, 11 Aug 2020 07:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597150669;
        bh=5kZ7YxttxebyfcrU+4BNO79A7QX0taIQyz6s3rEnSCQ=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=ej4csmqVFEdIurE/TC1VJTMdvzDhr7ANysL3S0q8E1nyr30K/viSgcaih5PKPwBuz
         06Y5/oBkccD+rCNBawKDIcX3EoiyTDCOUD0dOEAoSTp53cK3qRnhFA2SnAhgltE8dB
         vlD/YRtFSQdBaSHPFcQWKkPl0IX8Jtwpg27UVN0U=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07BCvndZ030038
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Aug 2020 07:57:49 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 11
 Aug 2020 07:57:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 11 Aug 2020 07:57:49 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 07BCvnJ0003748;
        Tue, 11 Aug 2020 07:57:49 -0500
Date:   Tue, 11 Aug 2020 07:57:48 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
CC:     <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 19/20] media: platform: vpdma.c: fix comparison to bool
Message-ID: <20200811125748.s3pdpwjmqmd5bffb@ti.com>
References: <20200807083548.204360-19-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200807083548.204360-19-dwlsalmeida@gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Daniel W. S. Almeida <dwlsalmeida@gmail.com> wrote on Fri [2020-Aug-07 05:35:46 -0300]:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Fix the following coccinelle report:
> 
> drivers/media/platform/ti-vpe/vpdma.c:946:5-26: WARNING:
> Comparison to bool
> 
> Found using - Coccinelle (http://coccinelle.lip6.fr)
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/vpdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
> index 2e5148ae7a0f..de600ffffbbc 100644
> --- a/drivers/media/platform/ti-vpe/vpdma.c
> +++ b/drivers/media/platform/ti-vpe/vpdma.c
> @@ -943,7 +943,7 @@ int vpdma_hwlist_alloc(struct vpdma_data *vpdma, void *priv)
>  
>  	spin_lock_irqsave(&vpdma->lock, flags);
>  	for (i = 0; i < VPDMA_MAX_NUM_LIST &&
> -	    vpdma->hwlist_used[i] == true; i++)
> +	    vpdma->hwlist_used[i]; i++)
>  		;
>  
>  	if (i < VPDMA_MAX_NUM_LIST) {
> -- 
> 2.28.0
> 
