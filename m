Return-Path: <linux-media+bounces-31342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF445AA1BD6
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 22:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DBE11B68382
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 20:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5439D262FD9;
	Tue, 29 Apr 2025 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cl9Z6yTV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B734A25F998
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745957417; cv=none; b=dOtbkFdIF0sOreGahP0xeYSDzjRpvDJHr+4/YePV0rwGBOSxr5FmFatJGLohuWczqtLxPyxXSPW1E7FdDhqdUiaXPvTGLp5RyxjhsXDJT0o2CMEjieH1rt/5EYMadieFVIwAwxV/NkSzSZxnN6oKmRXjbC7uBcsqjiIWST3l6QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745957417; c=relaxed/simple;
	bh=51j9wMphOPCIwqEuH0hMrLf4UQuo37NPpSzxZCZX6AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f4ocDRfc48RP1kPss3/67i7V6ouOpSwRZ121Jsibv/9vwOwT8gwoMDqNhpBK5pSLunqRR7rLJVVP1NphimOhfLY0+WMAqdmIeiFAQ87c2Y7qzeG1A1Ocp8IkvOvjsNqzrK+wl8L838lrnW8Cly1c4Uh9cGhWd1SIJI8iVwb7r2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cl9Z6yTV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCEDC4CEE3;
	Tue, 29 Apr 2025 20:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745957417;
	bh=51j9wMphOPCIwqEuH0hMrLf4UQuo37NPpSzxZCZX6AY=;
	h=From:To:Cc:Subject:Date:From;
	b=cl9Z6yTVPua7RElJM46EmPO5DfX1mGnmo8+rE78IpOQjIzGz3PjFFre/o5OF2LqtS
	 1UV7swVExlOnxqWEX9oWXC6DnEILcyKJ4cB5QKG+637m+8aFJQSGwFdL7IVEUrBbSj
	 M4Hd9KChIYnmAn1GFfHURXz4v2skb5f0f1aAH0OC/+5ce1fNu15fw5FKTZzo7DZn1E
	 d/J7wUcX0k6XPnbuxR4FhECE6jT6AeLqO5CqrlQrfiG6y4SFZDtsQPezN7SVyUeVLM
	 sOpN52YqNfG/CfNTjZyQVpn6tMlgt0ZQE+2viS889KtcFSfFsIBZIcVyxldtaRUAQm
	 GkCrhjrLTPkNw==
From: bod@kernel.org
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bod@kernel.org>
Subject: [GIT PULL FOR 6.16 Iris updates] Please pull platform-qcom-media-for-6.16-v2
Date: Tue, 29 Apr 2025 21:10:10 +0100
Message-ID: <20250429201013.146203-1-bod@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 6bc4841c536e18715cf0719f9eb6c47a3d35a63d:

  media: iris: add qcs8300 platform data (2025-04-27 23:27:03 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-media-for-6.16-v2

for you to fetch changes up to 6bc4841c536e18715cf0719f9eb6c47a3d35a63d:

  media: iris: add qcs8300 platform data (2025-04-27 23:27:03 +0100)

----------------------------------------------------------------
Add in QCS8300 and SM8650 Iris platform enablement

----------------------------------------------------------------

