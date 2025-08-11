Return-Path: <linux-media+bounces-39431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D61B20ACB
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 15:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3984A18C2BC8
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 13:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDC91F4C83;
	Mon, 11 Aug 2025 13:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="M4Xglp6e"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4241E25EF;
	Mon, 11 Aug 2025 13:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920361; cv=pass; b=UEZy80NfgnHxDrCdc2BbXjxninFKu6n1nh3EDA1xIZFkXsdcvTiEjPywcAVU0CqeyUlsrmb9B3RvPV9cQsG2LI/zoWXOeG/8fJmnHHnID1+m+cESh0HcJ1XScDO7gwsbcoTeu9j/MVDma5kawnh/6VgEos+4rkrL6krA/H+UhIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920361; c=relaxed/simple;
	bh=VKtriKu6+OTxWfXkXPT9YHsIjO6mIr4UX7XCSVbwSUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ogSiwt+4kdEfZwfYP+3XnOejup/AaOWqQleXeUJIv7oT2dsgUrwJPvCvl+mNCrvvXNDEQTO8rWqaSuVjKUyAV5y5nyh3pb9D0a0Ot1TkSO1aH0/xdDyOBc2zf23mL2GJ2aF1XL3pemAuxQib4BC8cy/qCV1+m4pgJ3hOPFMhng0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=M4Xglp6e; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1754920340; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CaqPVfLpXcf6B3O12hrTnSBLjueivtQ2cS9H7Od1BEg7ajGWiBFa9Kj4kYSKP9SnBiOJZrTfLe8xsTKVMcRq9a+wrFmAwjROCNmcvq9eQhB1W0M2zbayrVS18vqxb0kiMa9zZe/8jAYfN91vbuMUUsLU/0REhplvyUxv44xGAr4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754920340; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1ekrnY8bS2wg8D8B4NCNKhUtGyKfpA7Tqmni8Tj9DMM=; 
	b=T/PvQ64xlProZ9xS9pl4ZV2yYQ5nxGLPQqE8JeS1ukafk63rv2FWFT00C7Bt95P92U0TZfTim6zQ2NtzxGlYsnANP0bJhododQ+6bZMv4f9JUfm7rmYzjLFDpJc8eMxYHpdiknTcKUzIiVBaJ0CLo1nFNf789wYOEiQ6qmu6QKs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754920340;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=1ekrnY8bS2wg8D8B4NCNKhUtGyKfpA7Tqmni8Tj9DMM=;
	b=M4Xglp6eh7wYhZIOFhxuU2u93kfh4IuyjPWi2ovC/ABS/TriM8O4Tx1hjE/DqTsU
	kMNHmXxE0jC3XliupwVsZ3pxPX/Ho81gAjbyasLtVxdXRhgRjaZ7Pn7ez6g+g9gz3BW
	LKjw4MlOlUuY4Gf+hMeiGNxFFw3022udiSodcooQ=
Received: by mx.zohomail.com with SMTPS id 175492033739913.395742187955989;
	Mon, 11 Aug 2025 06:52:17 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 05/12] media: rkvdec: Add per variant configuration
Date: Mon, 11 Aug 2025 09:52:15 -0400
Message-ID: <5911981.DvuYhMxLoT@trenzalore>
In-Reply-To: <9fbc63d4-a12b-420e-8c99-f2f5fca5a9eb@kernel.org>
References:
 <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-6-detlev.casanova@collabora.com>
 <9fbc63d4-a12b-420e-8c99-f2f5fca5a9eb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Krzysztof,

On Monday, 11 August 2025 02:13:04 EDT Krzysztof Kozlowski wrote:
> On 08/08/2025 22:03, Detlev Casanova wrote:
> > This is to prepare for adding different variants of the decoder and
> 
> Prepare for...

Sounds better indeed.

> > support specific formats and ops.
> > 
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> 
> ...
> 
> >  static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
> >  {
> > 
> > +	struct rkvdec_config *cfg = ctx->dev->config;
> > 
> >  	unsigned int i, nctrls = 0;
> >  	int ret;
> > 
> > -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
> > -		nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
> > +	for (i = 0; i < cfg->coded_fmts_num; i++)
> > +		nctrls += cfg->coded_fmts[i].ctrls->num_ctrls;
> > 
> >  	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
> > 
> > -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> > -		ret = rkvdec_add_ctrls(ctx, 
rkvdec_coded_fmts[i].ctrls);
> > +	for (i = 0; i < cfg->coded_fmts_num; i++) {
> > +		ret = rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
> > 
> >  		if (ret)
> >  		
> >  			goto err_free_handler;
> >  	
> >  	}
> > 
> > @@ -1119,8 +1127,13 @@ static void rkvdec_watchdog_func(struct work_struct
> > *work)> 
> >  	}
> >  
> >  }
> > 
> > +const struct rkvdec_config config_rkvdec = {
> 
> Why isn't this static?
> 
> > +	.coded_fmts = (struct rkvdec_coded_fmt_desc *)rkvdec_coded_fmts,
> > +	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
> > +};
> > +
> > 
> >  static const struct of_device_id of_rkvdec_match[] = {
> > 
> > -	{ .compatible = "rockchip,rk3399-vdec" },
> > +	{ .compatible = "rockchip,rk3399-vdec", .data = &config_rkvdec },
> > 
> >  	{ /* sentinel */ }
> >  
> >  };
> >  MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> > 
> > @@ -1144,6 +1157,9 @@ static int rkvdec_probe(struct platform_device
> > *pdev)
> > 
> >  	mutex_init(&rkvdec->vdev_lock);
> >  	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
> > 
> > +	rkvdec->config =
> > +		(struct rkvdec_config *)of_device_get_match_data(rkvdec-
>dev);
> 
> If you need a cast, your code is wrong.

Right, some const/static addition is needed. I'll fix that :)

Detlev.





