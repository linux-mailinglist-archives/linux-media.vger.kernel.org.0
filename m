Return-Path: <linux-media+bounces-16713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E8295E064
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 01:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 062DE1F21D80
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 23:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDC51420DD;
	Sat, 24 Aug 2024 23:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L+v1PD8n"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919EA39FE5
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 23:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724542307; cv=none; b=ZSZZ+5lotirwNQC/+ojMlgBqucv70vV9g444kDvA9Fn2jDQazL08IGL4XacIqXbXLeVtdiiSzyipIDIT1CFP6mrJB+KIEB/IVNXKbmFEc0dNR9vjbkl/JYeVNRRa4uYxsXEJyc9Cn0kI+3cnp5dT1wTbcDLaF0lvJxLHkzWPv/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724542307; c=relaxed/simple;
	bh=f9uvjpy4I7k6m3fg4wqhRBpZMBQjILBeFJUEuoXBTBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iknGOwdMEB/xgaX4luF5kYF8RRD4QKy1TSHMYpOTfQgh15gl+G9XJsQm6U7NAr/KNeug6SqHGrIDUm/03jXgR0gnfa1tRcWfL7fR59mjDHq/x0sRLACwX2VgBQNezVvMJeUhdvp3QCyaHNKhyLVzQk/6233fHhOppyAZ0LpitN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L+v1PD8n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C41E3D6;
	Sun, 25 Aug 2024 01:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724542238;
	bh=f9uvjpy4I7k6m3fg4wqhRBpZMBQjILBeFJUEuoXBTBw=;
	h=Date:From:To:Cc:Subject:From;
	b=L+v1PD8nwQ0jBivmp1OXsDOmrUXU+cIy5I6J8nrt+fwqttF1IdmetJXnlqhvAMz7N
	 T2ntn6f8CBxA1OR2E4AIk+JfZaop0rQHpL9l2UwdZAylEh2p3+AGRdqSkGgwODbZ7r
	 kkFXGRVP1sm4g52vfoeI13kJOPoSmvja3LAhcL64=
Date: Sun, 25 Aug 2024 02:31:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [GIT PULL FOR v6.12] Miscellaneous V4L2 patches
Message-ID: <20240824233140.GA9543@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Mauro, Hans,

The following changes since commit a043ea54bbb975ca9239c69fd17f430488d33522:

  Merge tag 'next-media-rkisp1-20240814' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git (2024-08-14 17:18:47 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-misc-20240825

for you to fetch changes up to 8c8389bba49d8cd0ffc5bf2b27cb3233268a45d5:

  media: mt9p031: Drop CONFIG_OF ifdeffery (2024-08-25 01:42:02 +0300)

CI has passed: https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1256966.
I forgot to update the master branch before pushing the tag, so there
are warnings from checkpatch, but they're not caused by patches in this
pull request.

----------------------------------------------------------------
Miscellaneous V4L2 changes

----------------------------------------------------------------
Biju Das (2):
      media: mt9p031: Extend match support for OF tables
      media: mt9p031: Drop CONFIG_OF ifdeffery

Changhuang Liang (1):
      staging: media: starfive: Add the dynamic resolution support

Laurent Pinchart (2):
      media: v4l2-mc: Mark v4l2_pipeline_link_notify() as deprecated
      media: Documentation: mc: Replace deprecated graph walk API

 Documentation/driver-api/media/mc-core.rst         | 67 +++++++++++++---------
 drivers/media/i2c/mt9p031.c                        | 38 +++++-------
 drivers/staging/media/starfive/camss/stf-capture.c |  4 +-
 include/media/v4l2-mc.h                            |  3 +
 4 files changed, 60 insertions(+), 52 deletions(-)

-- 
Regards,

Laurent Pinchart

