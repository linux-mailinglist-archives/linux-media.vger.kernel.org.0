Return-Path: <linux-media+bounces-49893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45193CF2CC8
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 10:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 414BA3008D54
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 09:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1CA32D7E6;
	Mon,  5 Jan 2026 09:36:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224E832AADC;
	Mon,  5 Jan 2026 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605757; cv=none; b=qFOwDlk8AHNNK6cTfHjdou5W62Z03+WTbypAkThw+OKDeOeSbKrMK28kzeOZ85cAjEAGdMzwkf9d+wDQyF/adWFLEotlT1jEIOsPbNphbKeHw7gKAwLMC78RLojWS2euTya+Lh94nBfu4t5TQDu614ujMLfzptDgtX7yd+M5Q28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605757; c=relaxed/simple;
	bh=mfO3F1zU3I53+ImXbvSQxm7IBve2aVCZiiC2R68UuHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tUH/fQCGWkyo4mLTBlFxBXgoTQDWfV/u1kZpEMjx5ILQg8vYjm5xaYP6b90RjjPjWGPys9xB1i5ct0ByAjph/F16MEn13hcmlW0Q7huvnqNYRcGhp5CHnILeSw+s0Gw+P/wpmMhRf7CntdbMPkt7lf++mq+ujY/H4Fx0ijNP4Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d7244726ea1911f0a38c85956e01ac42-20260105
X-CID-CACHE: Type:Local,Time:202601051719+08,HitQuantity:3
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:c3c4f455-81d5-4add-92d2-0996856de9e2,IP:0,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:a9d874c,CLOUDID:c7ec3972578ced3459325caba54e9207,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850|898,TC:nil,Content:0|15
	|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d7244726ea1911f0a38c85956e01ac42-20260105
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2045610818; Mon, 05 Jan 2026 17:35:15 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: krzk@kernel.org
Cc: chenchangcheng@kylinos.cn,
	hansg@kernel.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org
Subject: Re: [PATCH v2] uvcvideo: simplify spin_lock using guards
Date: Mon,  5 Jan 2026 17:35:12 +0800
Message-Id: <20260105093512.194988-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e442c69e-5257-413e-9f3e-490aa5e37378@kernel.org>
References: <e442c69e-5257-413e-9f3e-490aa5e37378@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This is an undesired syntax explicitly documented as one to avoid. You
> need here proper assignment, not NULL. Please don't use cleanup.h if you
> do not intend to follow it because it does not make the code simpler.

Thank you for your correction and feedback. I made the change initially
because I saw similar patterns using "__free(...) = NULL" in patches from
other driver modules, which led me to overlook the core paradigm of
cleanup.h that requires a "declaration with a meaningful initializer."

Best regards,
Changcheng Chen

