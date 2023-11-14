Return-Path: <linux-media+bounces-313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 023587EA8D4
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 03:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7698C1F232A3
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 02:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92EE4697;
	Tue, 14 Nov 2023 02:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172507E
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 02:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C20C433C7
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 02:51:24 +0000 (UTC)
Date: Tue, 14 Nov 2023 03:51:23 +0100
Message-ID: <a28f5df4deda8e5b643c9a29489008b4.hverkuil@xs4all.nl>
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Nov 14 03:00:11 CET 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	b85ea95d086471afb4ad062012a4d73cd328fa86
v4l-utils git hash:	62257fd473db534314028e4616fe1bf4ba989b49
edid-decode git hash:	385c6cb09714593be3aa5b5d123e4e42bf4fbb05
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8523-g045d29f9
sparse version:		v0.5.0-8523-g045d29f9
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 67163b4b3a78582b3ea7eac29dbff793d6567b1d
host hardware:		x86_64
host os:		6.1.55-cobaltpc1

linux-git-arm: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: OK
no-of.config: OK
no-pm-sleep.config: OK
no-pm.config: OK
no-debug-fs.config: OK
sparse: WARNINGS:

drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion

smatch: WARNINGS:

drivers/media/i2c/adv7180.c:1514 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1514.
drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: error: too long token expansion
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: error: too long token expansion
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: error: too long token expansion
drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-core.c:362:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: error: too long token expansion
include/linux/page-flags.h:309 folio_flags() parse error: OOM: 3900868Kb sm_state_count = 31
include/linux/page-flags.h:309 folio_flags() parse error: Function too hairy.  Giving up. 0 seconds
include/linux/mm.h:692 __is_vma_write_locked() parse error: OOM: 3900740Kb sm_state_count = 1
include/linux/mm.h:692 __is_vma_write_locked() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-p2m.c:28 solo_p2m_dma() parse error: OOM: 3900740Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-p2m.c:28 solo_p2m_dma() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-p2m.c:55 solo_p2m_dma_desc() parse error: OOM: 3900740Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-p2m.c:55 solo_p2m_dma_desc() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-p2m.c:124 solo_p2m_fill_desc() parse error: OOM: 3900740Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-p2m.c:124 solo_p2m_fill_desc() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-p2m.c:145 solo_p2m_dma_t() parse error: OOM: 3900772Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-p2m.c:145 solo_p2m_dma_t() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-p2m.c:158 solo_p2m_isr() parse error: OOM: 3900904Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-p2m.c:158 solo_p2m_isr() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-p2m.c:179 solo_p2m_error_isr() parse error: OOM: 3900904Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-p2m.c:179 solo_p2m_error_isr() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-p2m.c:196 solo_p2m_exit() parse error: OOM: 3900904Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-p2m.c:196 solo_p2m_exit() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-p2m.c:204 solo_p2m_test() parse error: OOM: 3900904Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-p2m.c:204 solo_p2m_test() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-p2m.c:310 solo_p2m_init() parse error: OOM: 4000052Kb sm_state_count = 77692
drivers/media/pci/solo6x10/solo6x10-p2m.c:310 solo_p2m_init() parse error: Function too hairy.  Giving up. 1 seconds
drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: error: too long token expansion
include/linux/page-flags.h:309 folio_flags() parse error: OOM: 3906064Kb sm_state_count = 3
include/linux/page-flags.h:309 folio_flags() parse error: Function too hairy.  Giving up. 0 seconds
include/linux/mm.h:692 __is_vma_write_locked() parse error: OOM: 3905936Kb sm_state_count = 1
include/linux/mm.h:692 __is_vma_write_locked() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-enc.c:24 solo_capture_config() parse error: OOM: 3905936Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-enc.c:24 solo_capture_config() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-enc.c:127 solo_osd_print() parse error: OOM: 3905936Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-enc.c:127 solo_osd_print() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-enc.c:172 solo_s_jpeg_qp() parse error: OOM: 3905936Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-enc.c:172 solo_s_jpeg_qp() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-enc.c:204 solo_g_jpeg_qp() parse error: OOM: 3905936Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-enc.c:204 solo_g_jpeg_qp() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-enc.c:227 solo_jpeg_config() parse error: OOM: 3905936Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-enc.c:227 solo_jpeg_config() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-enc.c:254 solo_mp4e_config() parse error: OOM: 3905936Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-enc.c:254 solo_mp4e_config() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-enc.c:307 solo_enc_init() parse error: OOM: 3905936Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-enc.c:307 solo_enc_init() parse error: Function too hairy.  Giving up. 0 seconds
drivers/media/pci/solo6x10/solo6x10-enc.c:323 solo_enc_exit() parse error: OOM: 3905936Kb sm_state_count = 1
drivers/media/pci/solo6x10/solo6x10-enc.c:323 solo_enc_exit() parse error: Function too hairy.  Giving up. 0 seconds

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Tue Nov 14 03:20:01 CET 2023
virtme-64: WARNINGS: Final Summary: 3218, Succeeded: 3218, Failed: 0, Warnings: 4
virtme-32: WARNINGS: Final Summary: 3342, Succeeded: 3342, Failed: 0, Warnings: 2

date:			Tue Nov 14 03:50:09 CET 2023

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

