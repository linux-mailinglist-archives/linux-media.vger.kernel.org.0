Return-Path: <linux-media+bounces-18265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6780F978779
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 20:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5E632889C2
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 18:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4016C84DFE;
	Fri, 13 Sep 2024 18:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hIE3yaVC"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC229446AF
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 18:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250784; cv=none; b=VACxcXN27kE9wPAvEnuAenhnv2vBw99GOPANUuY+eAYvHKqk1JpN6iyMyzDj8slClWdu3DUvxkdI/TGgufaL28CBPHFMWF5XUWLAAu05S3xtIa3O1ne2DNrTzZv594gGhK69xJkEL1Ahz90jvKuxn611uDJEZCKehBdR+S1QvlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250784; c=relaxed/simple;
	bh=NJTF53hs9b0yjREacymSeu853Y2+WT9PEc5HH8MXaXk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AD7zsdmhN8JTFW3Bca0ss26Nx/DVbiNl9hBTx1PBcl9+2H02Jy+HW83prADUOi7OPbe08bVMeBZM+CrDqe35n9G5c7Rxep443SfPbOOnJJSQAjKi0BnE6CFQwmxgvCmPr3cX6qiqa0IC6vJMd5ez756RKJiNFSDy14bqSkFcOHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hIE3yaVC; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jmnP6KHl/jOT4lItRBpoKYE52n2shukLT9Cr0YERQWI=; b=hIE3yaVCN0HZ8lCTSO6Jg//gte
	mndftHgPhl9qET0v6AMEeVl8ockebCna4WPF4748f+YJMzccapU6HclV7sJ10BMKLSmmevRhroOhJ
	/EKv0GJz8Bt2IqRAUZKq+CXdJt/yQNsEpjM91zTlU2MNLBlqZ6/zwGaQ8c3YnRKwxv47LSjH5fTT0
	lJQQRT1KOmPsvGFbCo+eeCnKNU8VNg+VJ3DMu3Vg8FnlSFA0I2noKxVu7m2jVxgtSKsooQvhwl72o
	hCuOksUZ1bCLj8pRMtOXP0eWCgwg0frcApVo0IemRmIWBdEADowTAJbY1gmzuYptTTQwDDu8DKcRw
	tcvgm+Uw==;
Received: from 179-125-71-245-dinamico.pombonet.net.br ([179.125.71.245] helo=quatroqueijos.lan)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1spAgQ-00DQbL-Bh; Fri, 13 Sep 2024 20:06:14 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	kernel-dev@igalia.com,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH v3 0/1] uvcvideo: require spec compliance to avoid bugs
Date: Fri, 13 Sep 2024 15:06:00 -0300
Message-Id: <20240913180601.1400596-1-cascardo@igalia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some syzkaller reproducers have triggered cases where the devices would not
comply with the UVC specification and warnings would result.

These cases can be simply fixed by preventing the allocation of entities
with duplicate IDs or zero IDs.

v2:
Squash the two commits into one.
Version 1.1 of the spec already mentioned the restrictions on section 3.7.2.
Renamed uvc_alloc_entity to uvc_alloc_new_entity.
Print error message.
Return PTR_ERR values.
Fix checkpatch warnings.

I used section 3.7.2 excerpt from the spec as it is not specific to Output
units/terminals and it also mentions that zero IDs are undefined.

v3:
Check for 0 ID before checking for duplicate ID as originally.
Fix checkpatch format.

Thadeu Lima de Souza Cascardo (1):
  media: uvcvideo: require entities to have a non-zero unique ID

 drivers/media/usb/uvc/uvc_driver.c | 70 ++++++++++++++++++------------
 1 file changed, 43 insertions(+), 27 deletions(-)

-- 
2.34.1


