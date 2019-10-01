Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C664C30E4
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 12:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729974AbfJAKGB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 06:06:01 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54425 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725765AbfJAKGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 06:06:00 -0400
Received: from [IPv6:2001:420:44c1:2577:10df:bfa0:cde1:e23a] ([IPv6:2001:420:44c1:2577:10df:bfa0:cde1:e23a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FF2ZilKfh9D4hFF2diR6Fw; Tue, 01 Oct 2019 12:05:59 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.5] cx231xx: convert to vb2
Message-ID: <d22f3417-9f36-c57e-ceb9-fe84364222b9@xs4all.nl>
Date:   Tue, 1 Oct 2019 12:05:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLJ+2q/1K00Cu/M6ubBlDuhVJpRgBvTRK9PKu1YzUBBxDC24pPSivaT5EKAfQQsp+nLBXkFOLExTOL3CoUZI9VoesXH+7L8ml3g1BbGNk71cUsKXxxXk
 0c2RLA+I691L5/cI4W3RCvTBqnLwBcCOkRgDDrtO+q7dUvQ2bXBNyKKWe/iNCW12fVEyu1vcquVqZB+sPYbTTzidL7pH9d0Y1KyRgQutFfsUemOIhndsSqyr
 bKOib3tvNZ/0Ed17wdqw1Osl4rO3EqyinJ4h2G6JAFHT3CiosoRIc+5sFSPmtE1u
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-cx231xx-vb2

for you to fetch changes up to f52ff1811749b057007be565b23c98c5086c2743:

  cx231xx: convert to the vb2 framework (2019-10-01 12:03:38 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      cx231xx: convert to the vb2 framework

 drivers/media/usb/cx231xx/Kconfig         |   2 +-
 drivers/media/usb/cx231xx/cx231xx-417.c   | 509 ++++++++++++------------------------------
 drivers/media/usb/cx231xx/cx231xx-cards.c |   6 +-
 drivers/media/usb/cx231xx/cx231xx-vbi.c   | 172 ++++++---------
 drivers/media/usb/cx231xx/cx231xx-vbi.h   |   2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c | 795 ++++++++++++++++--------------------------------------------------
 drivers/media/usb/cx231xx/cx231xx.h       |  30 +--
 7 files changed, 407 insertions(+), 1109 deletions(-)
