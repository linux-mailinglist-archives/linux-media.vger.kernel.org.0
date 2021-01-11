Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58402F124D
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 13:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbhAKM1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 07:27:11 -0500
Received: from gofer.mess.org ([88.97.38.141]:40731 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbhAKM1I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 07:27:08 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7626DC635A; Mon, 11 Jan 2021 12:26:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1610367986; bh=0PLFH07OpIp/8r1eAd5ZWpKl3vj3W+gD/Pht82lO1lU=;
        h=Date:From:To:Subject:From;
        b=fVnZK/sttDRBpIHgHg695LAPocxxTdFc4d1bTxjTRehSuBQOMIFCq9aeu/Fsw0P5j
         2wXxkG/qT1YwdrBPePiVbu9mDM+Ru/d0nUStLuHT/+v4SJF3gKUu04QY2XK8kEK+vu
         zfn6M+EqvuXmsyqqnZxeqeyLvhAGB2EBkBtGAobm80yvqTx5kY6JCw8bXUKEJ05DNZ
         /GZ5Q3eBE6aEnujKdOhjD4KLFX3tL62PXABQN7r/eg8VXFsYostozzEbxnRyZs5qgJ
         x0FL5oLGrrJow79FnWlM/8kIc4PO+AN5E1CS9znowMEwY0shF4SUnW1KmKlA9v8vcw
         BUa2fzYbSQIdA==
Date:   Mon, 11 Jan 2021 12:26:26 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v5.11] rc fixes
Message-ID: <20210111122626.GA19679@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Yet another issue resulting from the nsec to usec conversion. :/

Sean

The following changes since commit 06b831588b639ad9d94e4789b0250562228722c2:

  media: rc: fix timeout handling after switch to microsecond durations (2021-01-11 12:58:44 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.11g

for you to fetch changes up to a409d65d15d14d467c1963b89afb39c1a24bf774:

  media: rc: ite-cir: fix min_timeout calculation (2021-01-11 12:14:57 +0000)

----------------------------------------------------------------
v5.11g

----------------------------------------------------------------
Matthias Reichl (1):
      media: rc: ite-cir: fix min_timeout calculation

 drivers/media/rc/ite-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
