Return-Path: <linux-media+bounces-26220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE2EA38705
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 15:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5DB73A7064
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 14:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259F3223328;
	Mon, 17 Feb 2025 14:53:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27CB21CA0E
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739804020; cv=none; b=c2aQKW4v3uZ2359Vcj+wiKGbcxB4ZihDZR5/fJIZf+U9kC/91gK80dY4yJ566HLO4PJ9rULuBHhGHtUiewEi7f+lgeVnyQSkerLzdr6K5VygukZc3Z9ZiqtG2UV0aDqbFwafTXEet0k0TorRgG+7SIngPM9uF0AFd7HDXor/q6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739804020; c=relaxed/simple;
	bh=9OFBXMSWKkCbBuB3z7wKhjVLR5feYs/LwTvQiVjSGiM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=UdHaxmroLZdiKlbC/6bv8ZZBdjFYLrQldf1hGhqbyjYTW3YK11Zz48jyyXrV/fs6DxirKfKrS5oNIwKtRi359WHTv6Tk3r0lD28i5ovHxkkj0ooUpg848hFdNhavR5YxTZawhRsBHjBTtmCMnakGCmDK29yAWlJJexPOHTR+LHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02693C4CED1
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 14:53:39 +0000 (UTC)
Message-ID: <30e7b019-6153-4493-b88b-2082eb47011e@xs4all.nl>
Date: Mon, 17 Feb 2025 15:53:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: cec: core: allow raw msg transmit while configuring
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While the CEC adapter is configuring, it is not possible to transmit a
CEC message with the CEC_MSG_FL_RAW flag set as this is blocked at the
ioctl level. Check if this flag is set, and if so, allow the message to
be transmitted. This is useful for debugging if the display has no
physical address (typically because the HPD is pulled low while in
Standby).

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/cec/core/cec-api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-api.c b/drivers/media/cec/core/cec-api.c
index c50299246fc4..2b50578d107e 100644
--- a/drivers/media/cec/core/cec-api.c
+++ b/drivers/media/cec/core/cec-api.c
@@ -222,7 +222,7 @@ static long cec_transmit(struct cec_adapter *adap, struct cec_fh *fh,
 	mutex_lock(&adap->lock);
 	if (adap->log_addrs.num_log_addrs == 0)
 		err = -EPERM;
-	else if (adap->is_configuring)
+	else if (adap->is_configuring && !msg_is_raw(&msg))
 		err = -ENONET;
 	else if (cec_is_busy(adap, fh))
 		err = -EBUSY;
-- 
2.34.1


