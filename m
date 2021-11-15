Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D726450127
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 10:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237135AbhKOJZS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 04:25:18 -0500
Received: from meesny.iki.fi ([195.140.195.201]:38688 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237556AbhKOJYT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 04:24:19 -0500
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 8947120223
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 11:21:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1636968078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=fBJu7i0xEB4o8JnYJVMPbtyREZ+Z1wPPY8ezKen9hpw=;
        b=ZIWeN5NxxpSVlMCyE6ZOj05AcWyd7jQyCr5wgelN2Na+F3Q2ksKgPeB0Wi7+TowVdfv5Ri
        Woi1nG2lIMeWXf/0ihmL5/3f+3F/CR5v8VpOI/k1DBHsQGp8pz9IELa4oxWfHzrj3FZx7u
        Tx+JFw7eRslQVkfbog62A87G6C7jPX4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D7F5A634C91
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 11:21:15 +0200 (EET)
Date:   Mon, 15 Nov 2021 11:21:15 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 5.16] hi846 fixes
Message-ID: <YZImi4YM3gNqe9ZR@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1636968078; a=rsa-sha256; cv=none;
        b=fVJsbfJR8LyFvPhVrMwQenhLA0MfRRulxq/9xK0gV1ijayo0h8RWNxFZE4lNcWPOplohiL
        HKIYzdj7YDbLHPtOVpLJfJ7DVMcyYrW378DIO4fYDW0JN5BPsRWANs4/VpDdtzJ/EKtAmS
        iv7esvWgF4cPRdKvwbVcPtHXbOi2e8I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1636968078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=fBJu7i0xEB4o8JnYJVMPbtyREZ+Z1wPPY8ezKen9hpw=;
        b=eSnFevl0ovGNeGZd/JgTEFKF/Ipgzt39n5Q5B8Mb0v7Z7cVvzIVCrp9qktR6mEusNcgxKF
        wG7QJ7m0LVo8wLuPSxQ7o39UF0h9xVXDZWN/Svyepk2wPua62L59eorm8cMumiJDLI5XLI
        9pucSLTgbe6gHLBWSnQcOFY1L0hICvA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are a few fixes for the hi846 driver just merged.

Please pull.


The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-5.16-1-signed

for you to fetch changes up to dabda88a8c4f80cb5c3b33a2ccd18eaa8ed21421:

  media: hi846: remove the of_match_ptr macro (2021-11-15 11:00:00 +0200)

----------------------------------------------------------------
V4L2 fixes for 5.16

----------------------------------------------------------------
Martin Kepplinger (2):
      media: hi846: include property.h instead of of_graph.h
      media: hi846: remove the of_match_ptr macro

 drivers/media/i2c/hi846.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Sakari Ailus
