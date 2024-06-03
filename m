Return-Path: <linux-media+bounces-12480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E888B8D86D8
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 18:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A47082887B3
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 16:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0566912E1F9;
	Mon,  3 Jun 2024 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="vpBp+ykU"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0634C26AD0
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717430520; cv=none; b=pMfq9c/42f1Invkkd8ZkQ818b3JeNiwSfbx4EoEwA92Vt2RJ6tNk/KrAIRmQTIrBdTUDYPoEz4L+rjgaWGNgPHlZBasw7ojyqaHX85YxN6T85sbDT02l4l6Etzi1LC+3S3utSNxt6Ijmse9DXwvwqovhh5+AdLMkDWOB/UZAwIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717430520; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=A1y0GRVzkDcdDQ5LYXh+l4t5RCA1oc7oerzKGoyD3QpO7eXUdKoAHp8cVxL/f5ZFDfDZHVWpdIGWfp9eYrah5wv+VEMsX4zo/3F4ztMqfeBvatGmjwvpBUfpCX7Vl8Qt+BeGooW8bXdlS/t0mvAMib8IZng58uxQbOK+bBpI9HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=vpBp+ykU; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717430517;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=vpBp+ykUi5nx7PXxtKkQsI0CLtqdnvcW5mL/d4/RA6xTl+ah3YaAZbZoAxXvkJBro
	 i5bXNtYOd2t0Bn/POdc3E1wVLTMuwQSKaBt2gle/WwHvpC50EBz5chpkgBvmGrPwHp
	 gAn+8m0YopL7W4letdCqYPlQMRh3dHY73+NUG/EOkhwKZIxBcT5wZUBsSniLHFGd/v
	 nueE1S1BkR5+xah0LKTTR/mBgKmed9ohPbIwD2EVcESkr8aQimNUAHr5UhEvHwzJ3R
	 2oL/IOuGed405Xc905796zW4OQlhJoPfZd8uo64gHeoAZepZTf9nWuC4QENimmid5x
	 Nc+laH5J5WD/w==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C9E173782162;
	Mon,  3 Jun 2024 16:01:55 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v2] Documentation: Fix AV1 struct documentation
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240531171005.2509859-3-frkoenig@chromium.org>
Date: Mon, 3 Jun 2024 13:01:41 -0300
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 mchehab@kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D8EDAEFA-10B1-428D-9D93-2B61087F5840@collabora.com>
References: <20240531171005.2509859-3-frkoenig@chromium.org>
To: Fritz Koenig <frkoenig@chromium.org>
X-Mailer: Apple Mail (2.3774.600.62)

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

