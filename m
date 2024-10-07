Return-Path: <linux-media+bounces-19164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1E099313F
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 17:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F8B6B284BD
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 15:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398D81D8E1A;
	Mon,  7 Oct 2024 15:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVaR0SlW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974721D7E3D
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315110; cv=none; b=iCCzMDf5BZiY4wPyezWvRUyxFCCNlVd+s+5k7F7ulkZSl+OplUoL6leFtjaq9psHQXAsXhWCOnCAVZqLuX6liltzCVxFf7YguLnNBI6qFUmYprSzN1RKeXUdAbF9KeawIKYFD8Y7+Ryewgtl2YCRZuHPY/pqyGaZmc9dks3UZp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315110; c=relaxed/simple;
	bh=1nO5rHUhiqlY3Mtr9AuNyYCgjFq/M+hRNP4ifPipb0s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=dyXuaAZuQDiZ5x3BPbnPSMXN6fpkuoI7HJCWbxFSJLcpWfNzrqb/bPtx4lvlfrQS8iG3nydDsp/s8tzUQd33KHY2Gx3VhjV4fz5jYOISlk/VmuxUS6HE5RNH3tVXfmJQbPJrB4ieyi41HeMrU55LT8jbqkRI/vvx/XnJr0H+qSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVaR0SlW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01C7C4CEC6
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728315110;
	bh=1nO5rHUhiqlY3Mtr9AuNyYCgjFq/M+hRNP4ifPipb0s=;
	h=Date:From:To:Subject:From;
	b=NVaR0SlWu6mmvqjMNDpX/qw3h7Ayc+d8b0jR5D0hjPlVYp53Fc5oxImb+eP+Gaky0
	 BGppEUW/h6WVm4iAx9YER0n1bcMrwIxd/9n8nCofEvPkaB5meHXLJOPFjuq2f4NGpW
	 +9l1j6aB8heAa7bdpH8c4GdSaorNJMkPFPYfkWFGEERT7jVQDbpVPkVZ+vp9u3iVqC
	 +RjdO2IRdMykfE6RNqVi1FoV+uLjzI+IIiRKBNGKaoPK8NMK+8gYSqevnCJDgFuX0D
	 atKIjfxRpMitz1MxfS/SkutI9VfPYoEuAhC8b7TODIR7uBFTBds4byoD4Z4ye8SZ5k
	 jcLZyAPjSZkDg==
Date: Mon, 7 Oct 2024 17:31:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: linux-media@vger.kernel.org
Subject: Changes at the main development tree
Message-ID: <20241007173146.6a35fa62@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

We're doing several changes on our maintainership process, aiming to provide
better handling of patches. Several changes will be happening along the time.

We'll be keeping you updated about such changes.

The first phase was already implemented: In the past, we were hosting two
separate trees (media_stage and media_tree). We opted to unify them and
name it as just media.git. Such tree is at:

	git://linuxtv.org/media.git
	https://linuxtv.org/git/media.git/
	https://git.linuxtv.org/media.git/

It contains two branches:

	next - Patches for the next Kernel version
	fixes - Fix patches for the current Kernel version

The legacy trees still exist and are now updated on every couple of
minutes to be in sync with media.git. Both trees have two branches
as well (master and fixes). We don't intend to keep them forever, so
please update your remote repositories to point to media.git.

We also updated https://git.linuxtv.org/media.git/ to make the
old trees invisible. So, right now, the only visible Linux Media
tree is "media.git".

The Jenkins CI jobs are already using the new repository.

Another change that already happened is with regards to CI: we're now
using a gitlab-based CI that has been checking patches before we
merge at media.git.

There are two different test sets there:

1. test patches we intend to merge at media.git;
2. test patches sent to the mailing list.

for (2), you can now see a new column at patchwork.linuxtv.org
	with S/W/F (success/warning/failure).

And opening a patch, like:
	https://patchwork.linuxtv.org/project/linux-media/patch/20240930-cocci-opportunity-v1-45-81e137456ce0@chromium.org/

There is a check table with:

Checks

Context 			Check 		Description
============================    ============    ===========
media-ci/HTML_report 		success 	Link
media-ci/report 		success 	Link
media-ci/virtme32 		success 	Link
media-ci/virtme64 		success 	Link
media-ci/bisect 		success 	Link
media-ci/doc 			success 	Link
media-ci/build 			success 	Link
media-ci/static-upstream 	fail 		Link
media-ci/abi		 	success 	Link
media-ci/media-patchstyle 	success 	Link
media-ci/checkpatch 		fail 		Link 

Details can be obtained by clicking at the Link.

Btw, media-ci nos has support to provide feedback via e-mail to the
patch sender in case of errors.

Thanks,
Mauro

