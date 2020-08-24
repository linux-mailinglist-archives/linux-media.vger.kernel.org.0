Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4AD25002F
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 16:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgHXOwS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 10:52:18 -0400
Received: from smtpout2.pt.lu ([194.154.212.5]:39020 "EHLO smtpout2.pt.lu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726825AbgHXOwN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 10:52:13 -0400
X-Greylist: delayed 963 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Aug 2020 10:52:13 EDT
Received: from smtp-2.pt.lu (unknown [192.168.20.202])
        by halon02.post.lu (Halon) with ESMTP
        id 89a987d1-e616-11ea-a3ce-005056b61c04;
        Mon, 24 Aug 2020 14:31:46 +0000 (UTC)
Received: from localhost (unknown [88.207.132.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jgmiller)
        by smtp-2.pt.lu (Post) with ESMTPSA id EA0F011058B
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 16:36:05 +0200 (CEST)
To:     <linux-media@vger.kernel.org>
Subject: DVB-t scan  uk-Storeton correction
X-Mailer: mail (GNU Mailutils 2.99.99)
From:   J G Miller <miller@yoyo.ORG>
Date:   Mon, 24 Aug 2020 16:36:01 +0200
Message-Id: <1kADZp-0002xz-1v@localhost>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Further to my previous e-mail message which contained an error,
the frequency for Storeton channel 28 PSB1  BBC A was incorrectly
specified as 492000000, when it should of course be

[c28 PSB1 BBC A]
        FREQUENCY               = 530000000



Sorry.

for any inconvenience caused.

Greg Miller

