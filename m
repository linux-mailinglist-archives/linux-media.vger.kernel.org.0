Return-Path: <linux-media+bounces-66064-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0XVbNTKVQ2q+cgoAu9opvQ
	(envelope-from <linux-media+bounces-66064-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:06:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022A6E29F0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:06:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gopqQaDV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66064-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66064-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8177C3055577
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237BE3EB100;
	Tue, 30 Jun 2026 10:02:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF4B233954
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 10:02:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813776; cv=none; b=EVMvNf7T1SUttybiTrES0tpvCTAyAHKMgMue97VIhky9M5vFEQ2fW0aRbzJ6GgwNx2S2iqmFWzRgcvDaYEoGx9AqIAFHtHlcUU1R6bLXuHZuj4xhX7Zq+/iiKl5/rpaMjEDkVbpUW2hKcOkzqzsCz3bWaOmzTRvBSDzFCUr9rDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813776; c=relaxed/simple;
	bh=BCMXw5TJ7jYRVH0f31QnCOhwM9pbdtILpgUrYeX7qac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ccmpkyDTTsjCEFSeFikyRZZG2Wrbe9H84VjSj/D+XCz+PFytM21SgXE8VdFxuh00jq6Lu2i5Tfej/U8ofCN2bMExQADPZXHsO8Mr92GkazQO8ViWa7meKgbr6Q2TynRunGzlKREiLiDzuzD5m5tyNAIx7ILkG4KzZidvdn5Hu+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gopqQaDV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE85E1F000E9;
	Tue, 30 Jun 2026 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782813775;
	bh=dKS+JsrmB0nQRtEYp+ZPS42Km+nu3uCUJsxTe/O2DRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gopqQaDVxUi4SYqMED5UqRNt8Rb1lD8RM0ar2CPhKyfCt7HXtf+HoMTtNzmWEc9A3
	 FHVUkrHNSuT0YsUhDu6A1AU8tpf08lJhIiX6akqTacE7T+aieVUqbcEF22B58szz31
	 1MzkwC9Di37eeYxQV7uajzfowhT+AdrtKohb4kKbQpshZusUVAkR3eYuLHUy2hXG6l
	 yrPmx4H46RfVTqyVrJ8KamfHKpfpQyyNSjoyNrUdgdw30fLznGnFbx2Y/qOh8bMUXR
	 Aenz0sI2RuBTOReKXT0e9SD45JV3ZdhYVMzBTm1LHOAuiuGKUS4XP6dJfU/O7ohh/V
	 dpx4BpL9lfa6w==
Message-ID: <05d38e6d-5f18-4d70-983b-1a28ddd22535@kernel.org>
Date: Tue, 30 Jun 2026 12:02:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCHv4 1/6] media: core: v4l2-async.c: unreg subdev if asc_list is,
 empty
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
 <2cf4473a9c16d0715aa081e234bb36c70fefce3c.1782716154.git.hverkuil+cisco@kernel.org>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <2cf4473a9c16d0715aa081e234bb36c70fefce3c.1782716154.git.hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66064-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mfo@igalia.com,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3022A6E29F0

When my em28xx USB device that uses the i2c tvp5150 driver is
disconnected, it crashes.

The cause is that the tvp5150 i2c module uses v4l2_async, but
the em28xx driver does not since it predates v4l2_async.

In that corner case sd->asc_list is empty, so
v4l2_async_unregister_subdev() never calls v4l2_device_unregister_subdev().

Modify the code so that, if sd->asc_list is empty,
v4l2_device_unregister_subdev() is still called.

Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
Changes since v3:
- updated commit message
- added comment to the code

Note: I did not post the other patches in this series, those are unchanged.
---
 drivers/media/v4l2-core/v4l2-async.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 888a2e213b08..f36d60e6ff41 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -898,9 +898,18 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 	sd->subdev_notifier = NULL;

 	if (sd->asc_list.next) {
-		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
-					 asc_subdev_entry) {
-			v4l2_async_unbind_subdev_one(asc->notifier, asc);
+		if (list_empty(&sd->asc_list)) {
+			/*
+			 * If the sub-device was registered through other means
+			 * than v4l2-async, there are no async connections but
+			 * the sub-device may still well be registered.
+			 * Unregister it now.
+			 */
+			v4l2_device_unregister_subdev(sd);
+		} else {
+			list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
+						 asc_subdev_entry)
+				v4l2_async_unbind_subdev_one(asc->notifier, asc);
 		}
 	}

-- 
2.53.0



