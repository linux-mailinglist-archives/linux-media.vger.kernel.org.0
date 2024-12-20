Return-Path: <linux-media+bounces-23955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F62C9F968E
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 17:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6943C189524C
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 16:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B76621A42A;
	Fri, 20 Dec 2024 16:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="TrodR7Cv"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65796219A9B
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734711899; cv=none; b=OdCosYUK0OKJFTY5W4qINfey2grva/C8FTDHlFhLFkpOZk8EFyb//NC1sjfqaRNhkhBT9ekq/8h8Un8PP8GaSCfV/5y8GBV2pR6SOQ5e5fkqHbilBx7VvKsFvr5z/eImACZsssNWNK+MvQMS0ISEuo1P+3hQm2pldkAYVRkhMIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734711899; c=relaxed/simple;
	bh=+koUnLpli7PR7cJbF8A7ocRYfKQB6ffbbyeZh3vkCb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KXc5Oj/gkBAYcUBFEcdHU8AmWOtJFnRDFzJB/4+LEeXyFhjRzYi3YFIJWSWeTauCLwZdkcph/0U0K4hUSH0KgIpMRBA/lOT5uBN2RLe/LUTcHwxMAbavFlWjUQgzbCPE44wpI/O83piUltBPIuOqqJozQWs8/MpIVHcAMLOuAQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=TrodR7Cv; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wHobf1N4RHGlJIwFfBQJGo52hGx6OuctfjjSkJkCbOw=; b=TrodR7CvLExBmFqjZxijl4HEao
	Et6WKu8My43K9zM+cqUPi6ml+haNJbQPbZUJ7wNonyzzDwInsSdjGhfl0ZJCv4HPxJ5zkeAuXYBEr
	xTo+IZWqnb6p07V92L9hLZgl9uK4ob2g3+4jh1JA1vIzexbaWj4YQQGrEcfHV8tAJ83IAqxqtgfg5
	HY6PJUftLZ0LE2xEhqFpuPTUSVx35tO9sZ2vV/UtD3dQbE7sPb7dGFoJtPz0hKsV8FDNvO4fxLXcx
	2GwJBr5BZefu1HSCEWuoKHOvoKTpLIc/ygwwZhIsRcEe9vnr+Luc+ddhlE7xhQZw0OpcVTiF0C+NK
	JyZ3wAWQ==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tOfo9-0004Hx-15;
	Fri, 20 Dec 2024 16:24:57 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tOfo8-00D8ak-2B;
	Fri, 20 Dec 2024 16:24:57 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.14] Qualcomm IRIS decoder (#106283)
Date: Fri, 20 Dec 2024 16:24:55 +0000
Message-Id: <20241220162455.3131281-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220153945.mbjvw6r23tdw6z5r@basti-XPS-13-9310>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241220153945.mbjvw6r23tdw6z5r@basti-XPS-13-9310/
Build log: https://builder.linuxtv.org/job/patchwork/409523/
Build time: 00:41:41
Link: https://lore.kernel.org/linux-media/20241220153945.mbjvw6r23tdw6z5r@basti-XPS-13-9310

gpg: Signature made Fri 20 Dec 2024 03:31:19 PM UTC
gpg:                using RSA key B71AEACB392868D77606602EC26580EBB1C88525
gpg: requesting key C26580EBB1C88525 from hkps://keyserver.ubuntu.com
gpg: Can't check signature: No public key

Summary: no issues. All 28 looked fine.

