Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD95CF8B99
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 10:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfKLJWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 04:22:38 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:47625 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727089AbfKLJWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 04:22:38 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id USNYib7EmQBsYUSNbiAWsd; Tue, 12 Nov 2019 10:22:31 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/5] Fix various syzbot errors
Date:   Tue, 12 Nov 2019 10:22:23 +0100
Message-Id: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAp2Ur2fDuqphm8JVUep51Qv9YrmE410jqLEkJhAtuuVozpejR0H5p46yO2llTYD5gNidG6LHLCW+Tri7kAsdWGe3QkhJlenyp1cYKZrbrAYEJRZl1aL
 jLiijHCMaSWnV/nsL5ueH1of7bJc0XIM3alWND2LHMntT+NZ03+NBn669zjEnJ+IBqzeYsvQwMm2Ow==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These patches fix a bunch of syzbot errors due to uninitialized
memory.

Regards,

	Hans

Hans Verkuil (5):
  gspca: zero usb_buf
  dvb-usb/af9005: initialize act_len
  dvb-usb/vp7045: initialize br[]
  dvb-usb/digitv: initialize key[]
  dvb-usb/dvb-usb-urb.c: initialize actlen to 0

 drivers/media/usb/dvb-usb/af9005.c      | 2 +-
 drivers/media/usb/dvb-usb/digitv.c      | 2 +-
 drivers/media/usb/dvb-usb/dvb-usb-urb.c | 2 +-
 drivers/media/usb/dvb-usb/vp7045.c      | 2 +-
 drivers/media/usb/gspca/gspca.c         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.24.0

