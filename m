Return-Path: <linux-media+bounces-3645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB97D82C05F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 14:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B1B286271
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 13:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5318F6BB26;
	Fri, 12 Jan 2024 13:03:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC66BB22
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jenkins@linuxtv.org>)
	id 1rOHBo-004VBl-Lz; Fri, 12 Jan 2024 13:03:12 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1rOHBl-00BpG5-1Y;
	Fri, 12 Jan 2024 13:03:09 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.8-rc1] media updates (#98610)
Date: Fri, 12 Jan 2024 13:03:07 +0000
Message-Id: <20240112130308.2818636-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240112135026.41496764@coco.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20240112135026.41496764@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/373489/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20240112135026.41496764@coco.lan

gpg: Signature made Fri 12 Jan 2024 12:30:21 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-dt-bindings-Add-JH7110-Camera-Subsystem.patch doesn't apply:
Applying patch patches/0001-media-dt-bindings-Add-JH7110-Camera-Subsystem.patch
The next patch would create the file Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml,
which already exists!  Applying it anyway.
patching file Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
patching file MAINTAINERS
Hunk #1 succeeded at 20683 with fuzz 2 (offset 45 lines).
Patch patches/0001-media-dt-bindings-Add-JH7110-Camera-Subsystem.patch does not apply (enforce with -f)


