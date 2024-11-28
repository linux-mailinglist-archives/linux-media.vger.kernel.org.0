Return-Path: <linux-media+bounces-22227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC949DBA6D
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D8C0B224E8
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 15:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F8A1B5ED1;
	Thu, 28 Nov 2024 15:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RcGmjM1D"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF30847B
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732807429; cv=none; b=XmQwY2+BvXuZdLPU3Zuc5y1SYTpM2MlXELLUMI12JTwEJgalhByZ/zOcGsr/NrVTUifhDB5KCTk63ftKioyfb4p5PKzjx2he3k7GThyz97RiWeohDAPjtlY0qo0aJimBHsWCAkL0SuNtPFM1RpIAQKCOU7HmczKxpJN7iU+ZOVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732807429; c=relaxed/simple;
	bh=TjJL8XGKvtuBLk3JL7hSsF1w/lI5jk6gPTr0AtnbZm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rIGdLdrjDDyZ54sdq0O5QCtNOISw9MZvTMdXdJNbDuml+BEjUl6rEwBxiOdJhyPDxVjPmJw7iMMP3sJ9vR7Qwl8fjdoBdtak+dyTf7Gf4lU272xewoWhNqSxIXVXmhRS21yluulP81BvRu/QEfm/MyTTuLDpQnqt48VAEXmFGgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RcGmjM1D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732807426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z/MPJY+e3nrfCVCiPIfO7sBSHLCTuiFP5hv61k0eT1Y=;
	b=RcGmjM1DGAFkyim3EuLhY0qEhV9AdaHhmQYzPkOf0xDGL8vikg67+tHJ9kQosWT5QI3B2K
	EpvgH2YQtruwUx1XiS9SBVtZn4x25aRctGzOCIyOFNEonydAEBN658EGQgv4SJuINGaZT7
	aw6mZ/cYDjWNHaMjmlSixgM/4W5jZS0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-99-gh_-cQ5QOGCqRzWik0821A-1; Thu,
 28 Nov 2024 10:23:45 -0500
X-MC-Unique: gh_-cQ5QOGCqRzWik0821A-1
X-Mimecast-MFC-AGG-ID: gh_-cQ5QOGCqRzWik0821A
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E5C6C19560A5;
	Thu, 28 Nov 2024 15:23:43 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.119])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BBF3C195608A;
	Thu, 28 Nov 2024 15:23:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/4] media: ov2740: Various improvements
Date: Thu, 28 Nov 2024 16:23:34 +0100
Message-ID: <20241128152338.4583-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi All,

I have been working on getting the ov2740 front and back sensors on a Terra
Pad 1262 v2 with IPU6 to work.

Patches 1-2 are nice to have improvements and this tablet needs power-down
GPIO support for the sensors to work.

The regulator support turns out to not be necessary, so we could hold of
on merging it until some design actually needs it, OTOH it is nice to
already have it in place.

Regards,

Hans


Hans de Goede (4):
  media: ov2740: Debug log chip ID
  media: ov2740: Add camera orientation and sensor rotation controls
  media: ov2740: Add powerdown GPIO support
  media: ov2740: Add regulator support

 drivers/media/i2c/ov2740.c | 58 ++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

-- 
2.47.0


