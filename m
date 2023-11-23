Return-Path: <linux-media+bounces-947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9357F68F3
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 23:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BDDA1C20B61
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 22:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28AF2F868;
	Thu, 23 Nov 2023 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X172IYZ2"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E8E1B6
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 14:22:55 -0800 (PST)
Received: from localhost (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FE266607394;
	Thu, 23 Nov 2023 22:22:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700778174;
	bh=RuG97d5bR5to7ac23obStwaMxFS8LvmBd6TJlr+o6ao=;
	h=Date:From:To:Cc:Subject:From;
	b=X172IYZ2cJ6dveJ/fDrWiap6ZZeBIg7e2DFIemO/dTpHV6DfZKR8AaK/dABlDpszB
	 uXuqtnkzRvIgGiL5BjQ/MufwCTJWcbEd4VpQ2RkGOlf6X1PswUCl0F1O7yhV/sV9Ay
	 63Cubf9doWM6eo7ryh6BS8RSXiWmWVDcPkDojvkH9kRukLEuAf0ByvUmZC8byPt5pg
	 YMdaDQ+ZfRp7RVvRd5l20OL/e0SfXJylZDZv/mMJkIekBG4wCuOOTU+9aFeCv0iRdA
	 vqyleRrOtz99y7DrJ4PWQbllfASA59MZEYROC0B4OYXd41lpmFFJBbpBxXqPkv9vwM
	 Kr1N1UsBsV35Q==
Date: Thu, 23 Nov 2023 14:22:49 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org
Subject: build scripts: branches with forward slashes in names
Message-ID: <ZV_QuX5YScktbQi3@mz550>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

Have you ever had a problem running the build scripts on branches with
forward slashes in their names?

So, for example, I add my repo to env.sh
myrepo=https://gitlab.collabora.com/chipsnmedia/kernel

I run ./build.sh setup and I can see it fetching my repo and including
my branch "dbrouwer/KConfig_fix", but if try to run:

./build.sh -test all dbrouwer/KConfig_fix

I get this error:

"fatal: 'dbrouwer/KConfig_fix' is not a commit and a branch 'build-test' cannot be created from it"

But then if I change the branch name to remove the forward slash "KConfig_fix" it works fine again.

Have you noticed anything similar? Could it be easily fixed?

Thanks,
Deborah


