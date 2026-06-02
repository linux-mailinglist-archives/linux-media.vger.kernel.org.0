Return-Path: <linux-media+bounces-63342-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCXlCD5OHmrmiQkAu9opvQ
	(envelope-from <linux-media+bounces-63342-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 05:30:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A847A627C64
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 05:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6531F302003B
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 03:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BB336922D;
	Tue,  2 Jun 2026 03:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="gAWqknYF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6A83233E8;
	Tue,  2 Jun 2026 03:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370686; cv=none; b=VVMlChvbb02NepKVc/ZW1FxM+GaAAhwkoHkzKOdyMg+oQ/N8uDW8jqXrk8Z5gBe4aiKVTf2qK/RxQAPZGGyJvk7dWC0zODv1kKzuVs4B1Zq4nIQDgzzQWD4sYc/EdO38fRyYnBudGDGxMoziQVtnMFB+60ZyuUj6lgU4v1RaT8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370686; c=relaxed/simple;
	bh=rcfAdu5JFRv9+PpxSEcJbPJNa2MF5dRJrCA4ua5wwCM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hOChlArlFp7bB+Pau7d8MFfJoSWmzZ01U3PYl1K3j+HgWkJbrhekcDaBJzGendKujhmvVGgarubQ+fxd5RD8CE4nZOzQb5HcA3mmj0r5ZOqS0ms3jeeT085g+qsZAuWlMS7GC0I7lOeQi7intxkCjFszSN7MGTDI9yev5/nq2hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=gAWqknYF; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780370678;
	bh=dn8IPubHvNeXEKuaSdvnWy3G1wDEcbOyhaRuCaFScCU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=gAWqknYFmAbwuWLhg58rFiASb2xteKDZCsspk+X+bLzXtYsjV6h28jMunRrexrs8n
	 cSCsKH9Bwxy96DWIrc7O+lRAx+q7oEAOzLFcRAKpwA6IT/h1TVtWlGs1WUU403Yfwu
	 y+8zuJoUAJXqwZ67AbBQ/4s0pguX671fjkOVQFxk=
X-QQ-mid: zesmtpsz3t1780370660t3a9299aa
X-QQ-Originating-IP: fmcuOrwsv3WsdBsngma3ziQrLiGuL1e1TVsH2hItIlk=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 02 Jun 2026 11:24:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18384957555402254008
EX-QQ-RecipientCnt: 15
From: Haowen Tu <tuhaowen@uniontech.com>
To: rafael@kernel.org
Cc: gregkh@linuxfoundation.org,
	hansg@kernel.org,
	kernel@uniontech.com,
	laurent.pinchart@ideasonboard.com,
	lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mchehab@kernel.org,
	oneukum@suse.com,
	pavel@kernel.org,
	stern@rowland.harvard.edu,
	tuhaowen@uniontech.com
Subject: Re: [PATCH v2 1/2] PM: hibernate: add pm_hibernation_snapshot_done() helper
Date: Tue,  2 Jun 2026 11:24:13 +0800
Message-Id: <20260602032413.1540166-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAJZ5v0gvcsowJL0oqKqaG-VFinpb9Rj06KNOkG9XaQ+6wp0Ygg@mail.gmail.com>
References: <20260528081840.3528089-2-tuhaowen@uniontech.com> <CAJZ5v0gvcsowJL0oqKqaG-VFinpb9Rj06KNOkG9XaQ+6wp0Ygg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MbBTNOOgGymjteoZkaQ8JswGfC+XpLjEY+MwtwKgppJfYH33yXSOzmdV
	e1yd3ScvY4UDRzFvizRIkiQakvNmzVjMxJO2PxD0zrgCfAetqgpP2r2itPzm2rsJnMZxebq
	W9AQjGBsO+DT2dPEasYoUoO+DcSyZyfSegMFzshcBQy3MHtAjVLvTawB4tMf/OA8mfQSAiC
	uE/2YxwUHkmo/XCpHizuJT2SDKKWIizDSukaB67LclGBbnB8MUcAfzh++jhET/zxM9OLS+n
	riX8KKCvLC4E9I4uS3Ik5LfR0HexsAPt7/5HIdiRlSBFzeKKvrVbryA6gql3m9WLrkiFXxg
	gboZQPbjIL2nc0UhOs1RAypU7LrS1pFIDU8boPVj/JP409DdXjLaKTcBdPoS9CZaUXwaHXN
	bt+fvGsL0Gyy3tFAsKSPs47hbD6sDx3FShVv8yQTe2ACIpakjLrN7Q5sj+ejuFHwsnWu5Ol
	+FuYvhjBj9sWrI6MFQyvxJyJ9dpFeGwyBZ3ctSZj+PtCjCc9Qtytparpwm17tiucWG9A827
	WggPn452dc/eXUMdgpmX9+XjibUeZV0mU+60DSYJTtyBDIZUQ33SSPom170vfHaWPskzuUK
	EU2ZPLodRgBlc3P1jO805Z00KKvcfOTZ4RPt+chSFU4c1C3XIrGiBRjw1Ihe2e2knyLzfYj
	nIU7rtG0Jyi6fIQN1gBcxwAdanoWGUHQZcUZLPqYVHgcOudHP70FJFnARv6kmWJ8hm7fnEE
	XHiQsqMoeQmdVzclLdpIg6AGdIVOLJSH7KkKe6xCNyumotTx4KGEeaKIqFwCMWchQYFykUM
	+kl1FuERC3ai52rHEw5twq/BUp1ZRF7CNN7XYqANBu3frjgrJ5SLZjn0LuYpslklR+nqKtz
	C245w6lvbIujB13mUqdTwxJ8tysy52YWfUP/sVbdQjpw5kyCGXTcrEBvz2YrgYv9zSsAZvl
	noOevTI4d8axBWoF6VF7hwaWeGtn0WWjJlHgbXOE9OdlpTN6rYJwrU6Gj+2p9Olume0yoLs
	9J1GwzTCp4JP+z1RMTBJJc0pppzugBm6NXhVohCw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63342-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,uniontech.com:email,uniontech.com:mid,uniontech.com:dkim]
X-Rspamd-Queue-Id: A847A627C64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rafael,

On Mon, Jun 01, 2026 at 08:22:00PM +0200, Rafael J. Wysocki wrote:
> On Thu, May 28, 2026 at 10:19 AM Haowen Tu <tuhaowen@uniontech.com> wrote:
> >
> > During hibernation, after create_image() saves the memory snapshot, the
> > kernel resumes devices with PMSG_THAW solely to write the hibernation
> > image to storage, then powers off.  Drivers for hardware not involved in
> > storage I/O have no reason to reinitialize during this transient phase.
>
> They do have a reason for doing it.
>
> Their poweroff (or shutdown) callbacks will be called while preparing
> to power off the system subsequently and they need to be ready for
> that.  The most straightforward way to achieve this is to resume so
> they can "suspend" again.

Thanks for pointing this out.

My understanding is that the hibernation image contains the state from
the snapshot point, that is before the subsequent THAW and image-write
phase.  Therefore, on the later restore path, the kernel resumes from the
state captured at the snapshot point and still goes through the normal
PMSG_RESTORE resume path.  The THAW activity after the snapshot is not
part of the restored image state.

That said, I agree that some devices may need to be resumed before the
final poweroff/shutdown callbacks run, so the wording in the changelog is
too broad.  I did not mean to suggest that all non-storage devices can or
should skip THAW resume.

The helper is meant to expose this PM state, not to prescribe that
drivers should skip THAW resume.  Whether a driver uses it would remain a
driver-specific decision, based on whether skipping the hardware
reinitialization is safe for that device, including its subsequent
poweroff/shutdown handling.  Drivers that need the normal THAW resume
before poweroff/shutdown would simply not use it.

In this series the user is uvcvideo.  For USB devices, and specifically
for UVC cameras, the device is hotpluggable and the driver already needs
to tolerate device removal and disconnect-like conditions.  The UVC
driver also does not need the camera streaming engine to be restarted in
order to write the hibernation image, while restarting it has a visible
side effect by turning the camera LED back on.  The check is placed after
the driver's frozen state is cleared, so if image writeout fails, the
driver is not left in the frozen state.

I will reword the changelog in the next version to avoid implying that
non-storage devices generally have no reason to resume during THAW.

> > Clear in_suspend before releasing snapshot memory on hibernation failure
> > paths and after swsusp_write() returns, so the helper does not report a
> > stale snapshot after the snapshot pages have been released.
>
> This last piece needs to be split off into a separate patch.

Sure, I will split the in_suspend cleanup into a separate patch in the
next version.

I will wait for your feedback before sending the next version.

Thanks,
Haowen

