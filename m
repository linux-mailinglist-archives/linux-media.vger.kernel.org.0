Return-Path: <linux-media+bounces-175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 286FA7E957E
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 04:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D563128107A
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 03:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61818C8E0;
	Mon, 13 Nov 2023 03:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjcVh+ll"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79032882A;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2E05C433CC;
	Mon, 13 Nov 2023 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699845835;
	bh=ISiPpDZ8woo0Xi7ycVYqOHGtVOPznIgTlrHk/L7ZLns=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LjcVh+llfSkhb92tYohU5ttjp2INTwZPGCfaQVF2C9wkykpIAvwtFKAyCT1uj2m0L
	 WMTh4er8MIf09WXMBMQKQye6pVSdBZhNUwjefeIZhDltcSg6quuC+QGaBpYTaujGZw
	 9VW3cXw/DFJkpLBoRwG6xvzsqSh/EXq3Ako5kJZBglgCOYidk5L9U1iGcOQLxm02VA
	 kRtqxqvMM1MAeMgzrD31rvitaMCqy6Bf6ZfTWYNbozT+vI6lbEC8tdDZo20YRSzaWh
	 0jr67l4UaQV6I9eFYaUu3+5XIWmA0iP/PQSydi+5dBsFnWYPU7POaBqX5qDP3N87a0
	 9l7dA0A3UocGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D9CC1E32711;
	Mon, 13 Nov 2023 03:23:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [1/2] media: platform: cros-ec: Rename conns array for the match
 table
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169984583488.27851.2726732061510632841.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:23:54 +0000
References: <KL1PR01MB38096300BE18095E51FB7A5BAECAA@KL1PR01MB3809.apcprd01.prod.exchangelabs.com>
In-Reply-To: <KL1PR01MB38096300BE18095E51FB7A5BAECAA@KL1PR01MB3809.apcprd01.prod.exchangelabs.com>
To: Ken Lin <ken_lin5@hotmail.com>
Cc: linux-kernel@vger.kernel.org, groeck@chromium.org, bleung@chromium.org,
 hverkuil-cisco@xs4all.nl, mchehab@kernel.org, rekanorman@chromium.org,
 sadolfsson@chromium.org, u.kleine-koenig@pengutronix.de,
 chrome-platform@lists.linux.dev, linux-media@vger.kernel.org,
 rasheed.hsueh@lcfc.corp-partner.google.com

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Hans Verkuil <hverkuil-cisco@xs4all.nl>:

On Thu,  5 Oct 2023 09:38:40 +0800 you wrote:
> Rename conns array to port_**_conns, ** is the ports which support cec.
> ex: dibbi_conns support Port D and B will be renamed to port_db_conns.
> Make it much cleaner and readable.
> 
> Signed-off-by: Ken Lin <ken_lin5@hotmail.com>
> ---
> 
> [...]

Here is the summary with links:
  - [1/2] media: platform: cros-ec: Rename conns array for the match table
    https://git.kernel.org/chrome-platform/c/678e8d804149
  - [2/2] media: platform: cros-ec: Add Taranza to the match table
    https://git.kernel.org/chrome-platform/c/cd5c11d5aacd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



