Return-Path: <linux-media+bounces-26169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 844FAA366CE
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 21:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3156F18957BD
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 20:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EC019DF41;
	Fri, 14 Feb 2025 20:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="WHV1mtgy"
X-Original-To: linux-media@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B419066D;
	Fri, 14 Feb 2025 20:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739564445; cv=pass; b=d/H/t1UeGqPNgPn4Qo8oEjFhsChzuO/95f36hYkGf7str954uKTIkkMry6OnJBroPrYDG5cZsCuWPB4lijQrFnY793GLRLcl2TYHAabnfwbfj2xdixoMDD39nsChlhK2kCaSrBx8ngZIw2UAKuQjGgb4DlrRYOBPZ9gdN9zjYp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739564445; c=relaxed/simple;
	bh=PnzvwBB4pI3+DP39vXExTLlnwBwf+qwiTB8gGaPqw74=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Kl/NiZ4UCFe0837xUiqGyCjWm2xRN04V06oCun/HFV3iLrM6SmHkXjZNz2jepwQ/naPUCIL9fK/Rc6ncrqeW21rHuPBh7EULsmSELiQ35M0fNiOfgc050fJq3/zBonfe609TpHPMScuNXGePvTP0BmFOVsp7ni4ONDMhs/l5YOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=WHV1mtgy; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739564430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=goflvi9jAIVrizOs8HAMfz9P6xsSRiAVP1kJDCkvg6DSiv1QuOhaK5FLKqW53jZRtjIe9+UJrWDk5GeRX5l1QUQAm/WRUl4UOYK2qOtAOg1F5D/KpBvOGhHDdesaroDsKnqTeqRW34URJlQLQL/S/GeDFGNPDCoMb9woF1ynhhQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739564430; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SqOfoj2KSrjVqeuyp909FB717ygPmWnh3bKUWLSJo4w=; 
	b=Mu8xyI5z9zsc2sqR1sWZ+4zfneVTC+KVXQ28e/rYFLsqbTgXdjE+JJKhCpzyvV4dskZKybtQkP+Jjhil4Rh69yG7EoGCWZ9McLk7rfjf8toHEf1BtqJNIgZXOkXOPakvldAF+x3oowY7Lx34c9RKT8HJHnneynjl3vQCj87yMlE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739564430;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SqOfoj2KSrjVqeuyp909FB717ygPmWnh3bKUWLSJo4w=;
	b=WHV1mtgydivRLBm2fKfMEu/VYfQQmNABRuysJXeudaEXSJ/orR4qWCErPkFkvGNJ
	PNDIPSFaJChmW6N+8Rcz73L+whm9AtITOrgp0WZ46er8A8DrK6EN3gCylp4A6Tgzy32
	7YqlBJZk4j3IlnExKMSfbuFrb5H9r/YrNrCNQBU8=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1739564427824276.79924110833304; Fri, 14 Feb 2025 12:20:27 -0800 (PST)
Date: Fri, 14 Feb 2025 21:20:27 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: "Jiasheng Jiang" <jiashengjiangcool@gmail.com>
Cc: "tiffany.lin" <tiffany.lin@mediatek.com>,
	"andrew-ct.chen" <andrew-ct.chen@mediatek.com>,
	"yunfei.dong" <yunfei.dong@mediatek.com>,
	"mchehab" <mchehab@kernel.org>,
	"matthias.bgg" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno" <angelogioacchino.delregno@collabora.com>,
	"fullwaywang" <fullwaywang@outlook.com>,
	"linux-media" <linux-media@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek" <linux-mediatek@lists.infradead.org>
Message-ID: <195061eaa10.dcfe0edc1589793.425795569509706466@collabora.com>
In-Reply-To: <20250131012830.22394-1-jiashengjiangcool@gmail.com>
References: <20250131012830.22394-1-jiashengjiangcool@gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Add scp_put() to free the scp
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hey Jiasheng,

 ---- On Fri, 31 Jan 2025 02:28:30 +0100  Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote --- 
 > Add scp_put() to free the scp if devm_kzalloc() fails to avoid memory
 > leak.

Your commit message sounds a bit like you copy-pasted your code into the commit message.
What kind of memory is leaking here? Are we talking about SRAM memory?
I'd reword the commit message to something like this to give a bit more context:

On Mediatek devices with a system companion processor (SCP) the mtk_scp structure has to be removed explicitly to avoid a memory leak.
Free the structure in case the allocation of the firmware structure fails during the firmware initialization.

---

Additionally, the commit title says close to nothing to the reader as well.
How about: Fix memory leak in FW initialization

But as I stated above you should clarify what kind of memory we are talking about here.

Also just out of interest have you ever actually experienced issues with this?
It seems to me that the situation where you run out of Kernel memory should be quite rare.

Regards,
Sebastian

 > 
 > Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deference in SCP")
 > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
 > ---
 >  .../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c      | 5 ++++-
 >  1 file changed, 4 insertions(+), 1 deletion(-)
 > 
 > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
 > index ff23b225db70..1b0bc47355c0 100644
 > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
 > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
 > @@ -79,8 +79,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 >      }
 >  
 >      fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
 > -    if (!fw)
 > +    if (!fw) {
 > +        scp_put(scp);
 >          return ERR_PTR(-ENOMEM);
 > +    }
 > +
 >      fw->type = SCP;
 >      fw->ops = &mtk_vcodec_rproc_msg;
 >      fw->scp = scp;
 > -- 
 > 2.25.1
 > 
 > 
 > 


