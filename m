Return-Path: <linux-media+bounces-32376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06918AB51D6
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 12:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC8F617060B
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 10:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839ED27F74B;
	Tue, 13 May 2025 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiVOhcJn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABB027B51A;
	Tue, 13 May 2025 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130887; cv=none; b=B8MiR8PxNVdJTWVrl9QnpQbdHaOaiKq/T3y0SAhWHuDFUEys1K4OnAbvWge8Pgmd0SH8HfRLEDf9IaIqrqhxNS0SxSzVv7Kdjfy1kCszob6p4tEZBWWaEuIDJd+YIR8JBZck3PFBMWWF5n2EE2PMKEvKPrkYcy1XRI5bPhvqvCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130887; c=relaxed/simple;
	bh=H0y27dOg2P0MQDU3OpxlLzjXcVSh03yvSfMo9m4F6pM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h82Y+nuq8k6eNDS4KoFJy/jNrnpkW8qQHgnhTB0dhXUyzBX3Get60GW/OWXCt2LBt0KR0AjqL7fEqSUBTOaCvR0VnpNiNgyDT0H8x7CA+MZWFbVYvza+DfeH8IlnTEjDLR7m2uujO611+rbBl9ZQ+G4QhKSzMqw8+v2N7G5wvsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiVOhcJn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA164C4CEF3;
	Tue, 13 May 2025 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747130886;
	bh=H0y27dOg2P0MQDU3OpxlLzjXcVSh03yvSfMo9m4F6pM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SiVOhcJnZXUr590y1SdNJcqg7z0YRhw09CgyQpn7Vm91BPjS/rrTrFKWKh4FbYTlw
	 ABGsufY7qAo9jHRSwmEaHrHz8R3Se1IPKORd9eVuDQAglq5kro7uUv590SG7w8/3QE
	 H043DqCd7uNNIKUQfl/lm6xWGRdkuiw8eSroRErNU3VfzK/OVcL2bqWYxrgtXPCO9f
	 8FoGXhOpsTvI8TEUmwitBAjnw36ruqG2xG0PpfPMBWkbmbNsSzibW37g5yykpZ2M3w
	 EGkvyTYlhQbarGeWgMNqeFuUD0coS0wu6eo35hncsufVHe8H2I6vMuSjfDldCrOwa8
	 HVNjvwUWWcfmA==
From: Lee Jones <lee@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Richard Leitner <richard.leitner@linux.dev>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20250507-ov9282-flash-strobe-v4-2-72b299c1b7c9@linux.dev>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
 <20250507-ov9282-flash-strobe-v4-2-72b299c1b7c9@linux.dev>
Subject: Re: (subset) [PATCH v4 02/10] leds: flash: add support for
 flash/stobe duration
Message-Id: <174713088439.4152099.12343512351616334508.b4-ty@kernel.org>
Date: Tue, 13 May 2025 11:08:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Wed, 07 May 2025 09:51:31 +0200, Richard Leitner wrote:
> Add support for the new V4L2_CID_FLASH_DURATION control to the leds
> driver.
> 
> 

Applied, thanks!

[02/10] leds: flash: add support for flash/stobe duration
        commit: 4cad0552415aa8c43af8d8d5924226c9b4c83889

--
Lee Jones [李琼斯]


