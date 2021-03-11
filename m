Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE7533760E
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 15:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233670AbhCKOqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 09:46:55 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:38451 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233597AbhCKOqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 09:46:45 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KMaGlPVCp5C8yKMaKleouA; Thu, 11 Mar 2021 15:46:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615474004; bh=L8fojB/MeYCNJXWeOszLhTZ46vC+uWtREc4kjM2d7lM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aT94vp2+qzCpABzp78YJlFbelCTNySdw2o4QyXND5UglfqetUBVabDxZYDOIxm2/P
         YtEQXvZmB2JVLhA8ZJgAoD+BhsQtIUOVk0XQ5bFzP6e30Ef2fQxYGZmXQE7pG5CYWo
         tdw2CE5cjj7CPW40q0aK2Y67sp2LgvimfoBi9lEDVO+B5vks7f0lOfp0nsX/q4Yrrm
         J1ZnOezwIePAhtPkL6Ea6crPkA57TMrPawtNhc4Nbn4fCKSOPY2JAUMen4UFKN7sTn
         +jNq6fkqBnAFfHL2ffCak6kjdRPd3WmaGbNJa22kQAxNCHXKAYONLOkN+a9AOx9tXA
         2tczxVtjGYh8A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] gspca/sq905.c: fix uninitialized variable
Message-ID: <2c46832a-99a8-73bf-ec85-085052f8b4db@xs4all.nl>
Date:   Thu, 11 Mar 2021 15:46:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfK26G9f32UoWeimkSw/1+IH7AZLAGUI0FzJl4EjCQ/I2v4jJlc87w1G5ehMzSftJc5SzhacRN9aJqWv4A6t+u7N0+0TiUvky07Deznf3GNd9tLb3e+E7
 79e4KUmP/qWeV+2pIlIRx5uVPxb0xKtd4sgEndmG7bzBJdUtbCU1ifjpAYDKx7+4BZ6ebGlsGILO7PMDSUaBUcJl4wt4weXDNeM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

act_len can be uninitialized if usb_bulk_msg() returns an error.
Set it to 0 to avoid a KMSAN error.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
---
diff --git a/drivers/media/usb/gspca/sq905.c b/drivers/media/usb/gspca/sq905.c
index 97799cfb832e..949111070971 100644
--- a/drivers/media/usb/gspca/sq905.c
+++ b/drivers/media/usb/gspca/sq905.c
@@ -158,7 +158,7 @@ static int
 sq905_read_data(struct gspca_dev *gspca_dev, u8 *data, int size, int need_lock)
 {
 	int ret;
-	int act_len;
+	int act_len = 0;

 	gspca_dev->usb_buf[0] = '\0';
 	if (need_lock)
