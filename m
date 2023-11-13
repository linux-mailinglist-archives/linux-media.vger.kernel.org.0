Return-Path: <linux-media+bounces-180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 397C47E95A9
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 04:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE2C0B20950
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 03:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857F2F9EC;
	Mon, 13 Nov 2023 03:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gV2mwSx7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A5D8F4D;
	Mon, 13 Nov 2023 03:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AB5BC4339A;
	Mon, 13 Nov 2023 03:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699846957;
	bh=Q3dq8DWnMulOXuMjQiCpfSy9K1thZhja7kCVRzQH/SE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gV2mwSx7+d9q+b8byiM2msq1fQ2ScwKmbKR/chG1biZ5R+gXbVW+kbEvMJ9HFWzHE
	 qt14N+sBNq1k5eVaGsw/gdZad/sJyXvZlFjwwCIfzmUrtOrteUVDKD9MQYYQIi3NYf
	 uJ9AAwhxrhmpuwoqF0EqWHZOeMTqWUbuNpfIa5nB/nbaRSJVFRb4bNSVnDIRv2wjli
	 gFJNCC78bgJvz0FUPTKejPHb3x3Np3YBkr3+WF8r3q2ypOE4HonbxpjdWtErKAXgl1
	 VuNhLgwuZz+iDtTAVQGH7SVFcsLEyafwZWuD4NxSBB0gu0TET69vlMw0LR8Nt+paOI
	 XEMU9s5Q8Em6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2DCF7C4166E;
	Mon, 13 Nov 2023 03:42:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] media: cros-ec-cec: Add Constitution to the match table
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169984695718.27851.18210928534967877237.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:42:37 +0000
References: <20230911081921.3515928-1-sadolfsson@google.com>
In-Reply-To: <20230911081921.3515928-1-sadolfsson@google.com>
To: Stefan Adolfsson <sadolfsson@chromium.org>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, bleung@chromium.org,
 groeck@chromium.org, rekanorman@chromium.org, linux-media@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Hans Verkuil <hverkuil-cisco@xs4all.nl>:

On Mon, 11 Sep 2023 10:19:21 +0200 you wrote:
> From: Stefan Adolfsson <sadolfsson@chromium.org>
> 
> Constitution has two HDMI ports which support CEC:
>     Port B is EC port 0
>     Port A is EC port 1
> 
> This patch depends on "media: cros-ec-cec: Add Dibbi to the match
> table".
> 
> [...]

Here is the summary with links:
  - [v2] media: cros-ec-cec: Add Constitution to the match table
    https://git.kernel.org/chrome-platform/c/5bc2de5f517d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



