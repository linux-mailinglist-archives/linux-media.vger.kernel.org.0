Return-Path: <linux-media+bounces-44202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7630BBCFB0E
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 20:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF15C189B81A
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 18:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4207D283FE9;
	Sat, 11 Oct 2025 18:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="srHKipDW"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF4D21770C
	for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760208499; cv=none; b=kj3qoAq0vkTbh4PltoOvRU5CgnSp+AygksMTEDFV36/r49cfgvWf9TbXhDfK3706l0l0qPRo0V44YAGZ1um8wH0WuBrTFcWil+XPB0NjvUGHYPKaT0IvfP4nplQ45FKux/7c9toT5fCb3KbopbiaYHg6V2s03Z2MM1inWcOdjdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760208499; c=relaxed/simple;
	bh=yVLi1c5MRJ+6kvPQbp6dDyeC9rVSuSe16Myvd8GMY6w=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=j+hyxoyr1P/vXsN+noI9wk08t1L6QwfSxWmM4BPx2c4DXiBnG285aJyDjsQT65ehm5hyK3smbSlMGTRiJfqh7bZThbbnTRDLlj/RqL13/RNwvc/542dTolSf7Y5kiHZsvru3g+gic3Cpb9n9a1BlynbH8bjwK9d6apmNw3tjYcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=srHKipDW; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yVLi1c5MRJ+6kvPQbp6dDyeC9rVSuSe16Myvd8GMY6w=; b=srHKipDWVffLlmll4CpCq7v/h+
	iNXYOlomRRCtZMW3tA81oeJGJoLXfhh/EShLuLciSJ3HawX8iqaDgnqDXJnoI8wUnT1Dv0FDZQMOt
	c5IIcrYCRy0y/mMnRZZR/q9elhjzcj2JMXJeymIp7gYMxxEIPFgBJEwXgcYzS2aLLKo78N65fTV7Q
	ITGhmD5nq+nU+6Mqz8kBlKt7ARj0tET89R3xvqRvV0/LIVxlAPRs3kzym07cIDoE6zgUbTMqKl533
	3hqjSu9MvH/2dGHaLlMAvScDftQbvPxhKiW0rl8vOgKWWIJNJEKfMl7swzHQhiedxd+QRWpj1J1My
	XjgyKG6w==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1v7edd-0008DB-2N;
	Sat, 11 Oct 2025 18:48:17 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1v7edd-00Ftxl-2C;
	Sat, 11 Oct 2025 18:48:17 +0000
Date: Sat, 11 Oct 2025 18:48:17 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Message-ID: <2022247673.3.1760208497673@builder.linuxtv.org>
In-Reply-To: <740682063.2.1760208207715@builder.linuxtv.org>
References: <740682063.2.1760208207715@builder.linuxtv.org>
Subject: Jenkins build is back to normal : libcamera #1500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: SUCCESS
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/libcamera/1500/display/redirect>


