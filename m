Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8326B4F46C
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2019 10:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfFVIm4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jun 2019 04:42:56 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42939 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726114AbfFVImz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jun 2019 04:42:55 -0400
Received: from [IPv6:2001:983:e9a7:1:c087:883d:6305:97f] ([IPv6:2001:983:e9a7:1:c087:883d:6305:97f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ebbnhVRr37KeZebbohQweA; Sat, 22 Jun 2019 10:42:52 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] coda fixes and improvements
Message-ID: <646bd896-77bc-8a7f-4c22-8b70499e91ad@xs4all.nl>
Date:   Sat, 22 Jun 2019 10:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJvDAuxb9YJ8XWHT9jfLH6BAJlfRzaHSQvmNcU8PtN9inC1oGDU5yOeVgKptTnF9BOvs1ZBi1LgB9JyM2/NL8YSeMmPR9qrW7CN5zKjmVcUiI8PyN5UD
 vN6GIlX7UUBgWpY/99E4nQWOKlMc053KalBa3JKEzZ8WJFnLJ4xXWnlIWefYrln3XgfvNun7Hmuy9/M9q2DTf1LhfHJr775MP265k2FcRhAdsehXiiP3PpwF
 zhEN6TfeI/JwxC4hExs2e4urVIOh+uZanHzYyrdbNuoF20DPY+1d1poRdWk4o96MpedNmKgYoh8mVa0vhi8Qsg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 3a959dcd11a4b1f55bbb4a37d3bac685c4e106b1:

  media: mt9m111: add regulator support (2019-06-21 17:56:39 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3t

for you to fetch changes up to f109771a576144a048e234c93a01f0f17a9fbf0f:

  media: coda: encoder parameter change support (2019-06-22 09:45:13 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Marco Felsch (2):
      media: coda: fix last buffer handling in V4L2_ENC_CMD_STOP
      media: coda: fix V4L2_DEC_CMD_STOP when all buffers are already consumed

Michael Tretter (1):
      media: coda: implement CMD_START to restart decoding

Philipp Zabel (25):
      media: coda: use mem2mem try_en/decoder_cmd helpers
      media: coda: fix mpeg2 sequence number handling
      media: coda: add coda_wake_up_capture_queue
      media: coda: split decoder sequence initialization out of start decoding
      media: coda: add sequence initialization work
      media: coda: implement decoder source change event
      media: coda: integrate internal frame metadata into a structure
      media: coda: make coda_bitstream_queue more versatile
      media: coda: pad first buffer with repeated MPEG headers to fix sequence init
      media: coda: do not enforce 512-byte initial bitstream payload on CODA960
      media: coda: flush bitstream ring buffer on decoder restart
      media: coda: increment sequence offset for the last returned frame
      media: coda: allow flagging last output buffer internally
      media: coda: mark the last output buffer on decoder stop command
      media: coda: only set the stream end flags if there are no more pending output buffers
      media: coda: mark the last output buffer on encoder stop command
      media: coda: retire coda_buf_is_end_of_stream
      media: coda: only wake up capture queue if no pending buffers to encode
      media: coda: flag the last encoded buffer
      media: coda: lock capture queue wakeup against encoder stop command
      media: coda: mark last pending buffer or last meta on decoder stop command
      media: coda: mark last returned frame
      media: coda: store device pointer in driver structure instead of pdev
      media: coda: add coda_slice_mode() function
      media: coda: encoder parameter change support

 drivers/media/platform/coda/coda-bit.c    | 403 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------
 drivers/media/platform/coda/coda-common.c | 244 +++++++++++++++++++++++++++++++++++-----------
 drivers/media/platform/coda/coda-mpeg2.c  |  43 +++++++++
 drivers/media/platform/coda/coda-mpeg4.c  |  38 ++++++++
 drivers/media/platform/coda/coda.h        |  33 ++++++-
 drivers/media/platform/coda/coda_regs.h   |  18 ++++
 6 files changed, 637 insertions(+), 142 deletions(-)
