Return-Path: <linux-media+bounces-12972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FB0904825
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 03:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3129E1C229C0
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 01:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEEA15D1;
	Wed, 12 Jun 2024 01:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="S4XYDp21"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EAB10F2
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 01:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718154578; cv=none; b=GIyhre9y84Kt5eLOc3mOV0R3K1wxoog6av9U+2qhclzzUMrJf83/KRTv30JsftDJ3X0QHRPhTpzAHm51DecK2Q+mPQZxSO5tHyJtn4uUVne7Q5HPx+2UIqVa6y0qNoU2LEV36C1npx7RueQgP2KQgsBPh3A0VVTHZWBmSey8IHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718154578; c=relaxed/simple;
	bh=ki8tB4udTMonss56fTtHm7xLIwPEFF2/WtALOYSZLaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jjtJKaQxvNSLUw2dNionW8rWIAGh3itluogSjBuAB7urq+rGuJGRkZFp1J7iw43XRNQ8UObko5ZgI/5ZLhZSgtO9HnJEXeMXAtRYdg12XZpFtjOAj7lwxmzzvbWXeVggea+DpARUuXY8vpcAjJwC6fs9qL6Ib9OTnhk8AN7oC0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=S4XYDp21; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1718154235; bh=ki8tB4udTMonss56fTtHm7xLIwPEFF2/WtALOYSZLaA=;
	h=Date:From:To:Cc:Subject:From;
	b=S4XYDp21W2EwhH+4h9gl+eY69c8uyz06kAEC2DLvabWbtStDEbI6tWe8jSEtWk++W
	 BP/clS+QFosr0iLN7B+9Qd8uWPs2ZXxKdvuJCtNF5qybgmTBmwbTpWgB2yM7dbtukR
	 3gzGGxFcstbUYi20jVlG/gnuq6Pp3eDtD/HxzAjLIK1222hwUJoVo6fJs7xVQW4fiu
	 9mLrGcdKR29m/O02Uzn00N/Owi8ouKi+iONfq5iBTS4AUzcdlowfOdU6CjBTkgjRYp
	 FzIibE/M+CVY11U02wwROf/GC7GviB0U44l/I5sHdZyTA30Nuq6uqJZpyD8q9pv2Mz
	 kF31ZnnkJhSdg==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id D7C68100100; Wed, 12 Jun 2024 02:03:55 +0100 (BST)
Date: Wed, 12 Jun 2024 02:03:55 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: [GIT PULL FOR v6.11] Convert mtk-cir binding
Message-ID: <Zmjz-6FMq6mXtPJ5@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro, 

I think this is ready for merging, it looks good to me. Please do check
though.

Thanks,
Sean

The following changes since commit 1034ead1a7333e65e516c583f757717f461eba43:

  media: amphion: Report the average QP of current encoded frame (2024-06-10 10:24:30 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.11b

for you to fetch changes up to bfeb741c8f4db82a9491f209447d7db1092c1ed2:

  dt-bindings: media: convert Mediatek consumer IR to the json-schema (2024-06-11 16:48:47 +0100)

----------------------------------------------------------------
v6.11b

----------------------------------------------------------------
Rafał Miłecki (1):
      dt-bindings: media: convert Mediatek consumer IR to the json-schema

 .../bindings/media/mediatek,mt7622-cir.yaml        | 55 ++++++++++++++++++++++
 .../devicetree/bindings/media/mtk-cir.txt          | 28 -----------
 2 files changed, 55 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mtk-cir.txt

