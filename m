Return-Path: <linux-media+bounces-23391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6C19F0CCB
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 13:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DF17282EEA
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 12:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184511DF975;
	Fri, 13 Dec 2024 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="RblU+hFv"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AF81DEFEC
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734094661; cv=pass; b=ocY+xemy37Qfm9V6VmTu+tr1p89fcn4+aetFCGfcHx0p05TDbyEazja2Eg2guon8DP+KuZ8HbgtzLcI3+am9FrJw28xRKrdKuGzQ2qEZJHE/3H7UnXXcwYVMWI0c/AkfHWeR/+pACMVEgXVDFc04VPdFwezhwCtSAPtFk6Cpu2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734094661; c=relaxed/simple;
	bh=ojm6w7DE7lzo63WVm2grI7Nw3WF3sIyMyKibQMVFitA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZRPn2cwczpItq2u0HYfzFAixfc5Ip8cp9FFgdzOTA0nTy2VpbDPFUCXX27L8P/4YJfMUUiHZla3sVWcUr5Mq3pjAUXCacJUNXWpOo2/oHDPzrcRL4RD86CC2460deYHyNgwGLQRfbXN/BlilrsQ4u3tvUI6GGgk9LTiFSsQUS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=RblU+hFv; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1734094653; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Am69QsZMcFlLP5Fnnd26/B+ElDQa1wuaOA6czACcXxWMGMre/S3dTW+cqS4XufI8Kx63v0QV35aeOg2DJ+f5X1DP8k2MyKFtxBPK6atQ+B3NRsqvxpdPbgK87HoWB0oHRvWM7FRUNqEAMxmdm6BFVJF7oL4but3Cmc8GyE1bx5c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734094653; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/ck5bekP9umMPhYDMS/50Zo6FZqXCiZigvWyMo2Er+w=; 
	b=m1onflMFyC6cAWM8yzVuQ5YROIVbnpQf15nUrY9a8fAUzHGoGi3dTzDm4o5z0XkDhNYSd1+AEgVIhUNgqJUaty0gc2RLsKdmVpHAP9Vqn8O2CDIyKVsactkyQpoLa5ME/ZZPXlv2ReYMqNtEwzwI3xrDtORQ9zqwlqNtXRnvIng=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734094652;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=/ck5bekP9umMPhYDMS/50Zo6FZqXCiZigvWyMo2Er+w=;
	b=RblU+hFvLbtidWaPKCq9MQfnJWEJSzqpOTkqWZFh4HAb/CPZzwe68C9ifMX+Js0n
	oBdO05SS15AcPVwBQH5b3ibMgM/zHIyMoNRqeAqyYzMzjxmb2tavyPUVZ9RfororJqp
	XlJmgjS1yjua+UNi/43Ajiefu8RorDQLA5cUiq0c=
Received: by mx.zohomail.com with SMTPS id 1734094650334996.2822668901513;
	Fri, 13 Dec 2024 04:57:30 -0800 (PST)
Date: Fri, 13 Dec 2024 13:57:26 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jenkins <jenkins@linuxtv.org>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.14] Various MDP3 changes (#106060)
Message-ID: <20241213125726.zzn7uoq7craa26nb@basti-XPS-13-9310>
References: <20241212155251.gbzb73ibvlzpfxsv@basti-XPS-13-9310>
 <20241212160919.1688155-1-jenkins@linuxtv.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241212160919.1688155-1-jenkins@linuxtv.org>
X-ZohoMailClient: External

Hey Mauro,

On 12.12.2024 16:09, Jenkins wrote:
>From: builder@linuxtv.org
>
>Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241212155251.gbzb73ibvlzpfxsv@basti-XPS-13-9310/
>Build log: https://builder.linuxtv.org/job/patchwork/407264/
>Build time: 00:00:00
>Link: https://lore.kernel.org/linux-media/20241212155251.gbzb73ibvlzpfxsv@basti-XPS-13-9310
>
>gpg: Signature made Thu 12 Dec 2024 03:34:52 PM UTC
>gpg:                using RSA key B71AEACB392868D77606602EC26580EBB1C88525
>gpg: requesting key C26580EBB1C88525 from hkps://keyserver.ubuntu.com
>gpg: Can't check signature: No public key
>
>
>Build aborted due to a fatal error:
>FAILED: patch patch patches/0007-soc-mediatek-cmdq-Remove-cmdq_pkt_finalize-helper-fu.patch doesn't apply:
>Applying patch patches/0007-soc-mediatek-cmdq-Remove-cmdq_pkt_finalize-helper-fu.patch
>patching file drivers/soc/mediatek/mtk-cmdq-helper.c
>Hunk #1 FAILED at 524.
>1 out of 1 hunk FAILED -- rejects in file drivers/soc/mediatek/mtk-cmdq-helper.c
>patching file include/linux/soc/mediatek/mtk-cmdq.h
>Patch patches/0007-soc-mediatek-cmdq-Remove-cmdq_pkt_finalize-helper-fu.patch can be reverse-applied

This applies fine on the Media CI and passes all the tests: https://gitlab.freedesktop.org/linux-media/users/patchwork/-/pipelines/1328867
So, I think this error message is incorrect.

Regards,
Sebastian

