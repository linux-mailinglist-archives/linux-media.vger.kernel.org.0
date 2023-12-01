Return-Path: <linux-media+bounces-1494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F17A6801343
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 20:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A569B1F20FB9
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 19:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDED1495EF;
	Fri,  1 Dec 2023 19:01:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E95710DA
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 11:01:03 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jenkins@linuxtv.org>)
	id 1r98l3-006vfR-FT; Fri, 01 Dec 2023 19:01:01 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1r98l0-00BKDA-2V;
	Fri, 01 Dec 2023 19:00:59 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR 6.8] V4L2 sub-device API changes plus new drivers (#97582)
Date: Fri,  1 Dec 2023 19:00:57 +0000
Message-Id: <20231201190057.2699291-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZWoiTsq_2E3tkk_P@valkosipuli.retiisi.eu>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZWoiTsq_2E3tkk_P@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/361608/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/ZWoiTsq_2E3tkk_P@valkosipuli.retiisi.eu

gpg: Signature made Fri 01 Dec 2023 06:10:44 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0005-media-wave5-add-OF-and-V4L_MEM2MEM_DRIVERS-dependenc.patch doesn't apply:
Applying patch patches/0005-media-wave5-add-OF-and-V4L_MEM2MEM_DRIVERS-dependenc.patch
patching file drivers/media/platform/chips-media/wave5/Kconfig
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/chips-media/wave5/Kconfig
Patch patches/0005-media-wave5-add-OF-and-V4L_MEM2MEM_DRIVERS-dependenc.patch can be reverse-applied


