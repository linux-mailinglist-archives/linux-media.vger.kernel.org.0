Return-Path: <linux-media+bounces-30127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F286A87BC7
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2963217288F
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BA4263C8E;
	Mon, 14 Apr 2025 09:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.com header.i=@tuta.com header.b="BvjI59Ze"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EC7263898
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622542; cv=none; b=M/MQJKC/Hyu4pLTINghGknyMZAIXtdustr5vhwqA+//TC8vcLA5mx4Q03XrFe4j7wp5DDDg6ShIwzFlOvI/adcv/BCHYa+wmCdvY9EL7gAwil+m/37ZkWInYhu3ATPnpVBXPk2lBFrJPzp5E/UULqA9bcA9nWsCvkbeFu4M4++M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622542; c=relaxed/simple;
	bh=xP0ThxmKib/kaT9Qshs0KOcz5WaInbSz7QaevFdIeHo=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=jE3RgDkRcCsZHPlOtJGk9wDvSDbun70u3UQBywFy6egP9E5jmI+bSn27rvZU2BBtkJ5ntNMCT+ZNHBuL4G27uZwuhfyWaEyFOYSrPZvpnQFf1RDJct5lnaRGd9im9VgjUJLt8JQ8npVctelwqIZgCwmiPpg3AZWGWHfVWfDqAEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.com; spf=pass smtp.mailfrom=tuta.com; dkim=pass (2048-bit key) header.d=tuta.com header.i=@tuta.com header.b=BvjI59Ze; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.com
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 508B37A12A5A
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 11:16:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744622217;
	s=s1; d=tuta.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=xP0ThxmKib/kaT9Qshs0KOcz5WaInbSz7QaevFdIeHo=;
	b=BvjI59ZeEFO83XwIwTJo6xFHUk+X0ncMUm8GSqzsadluqlcxYuE1yimB4pm/mJUC
	72CSa8EN+h5nwcFhhFq+AnQNmMkUVh7us8P3XakmVST89Ds9+iBJ7AaZTPnJl8vo6ue
	VNN90ACLlO0Yf97P8nEmN7KFyCcw3xLssNxJsAFFvshTWy9oGgd7bD+2U12h5Qq4Q4V
	VyaYT4sT7CoCQvd+8FefuC3JxtpObm20ZQaTZqdxtpOQMuFTc+bBWzcbx3Z1pBOW6ie
	S+oaCniA6Nsftv7W+vOGPVd5ntRWueCkUhxTQhMyXQ/uEsft/ldO1ZsUm4XkuKy4xk6
	Ju1GBPkqLw==
Date: Mon, 14 Apr 2025 11:16:57 +0200 (CEST)
From: Andrej Gardijan <andrej.gardijan@tuta.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Libcamera Devel <libcamera-devel@lists.libcamera.org>,
	Linux Media <linux-media@vger.kernel.org>
Message-ID: <ONn_aOl--F-9@tuta.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hello,

I'd love to attend if there are free seats available!

Kindly,
Andrej Gardijan



