Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022052A357
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 09:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfEYH4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 03:56:13 -0400
Received: from keetweej.vanheusden.com ([82.161.210.122]:50382 "EHLO
        keetweej.vanheusden.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfEYH4M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 03:56:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by keetweej.vanheusden.com (Postfix) with ESMTP id 71E05162CF7
        for <linux-media@vger.kernel.org>; Sat, 25 May 2019 09:56:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vanheusden.com
Received: from keetweej.vanheusden.com ([127.0.0.1])
        by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uPXCM0-CFzrO for <linux-media@vger.kernel.org>;
        Sat, 25 May 2019 09:56:09 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com [192.168.64.100])
        by keetweej.vanheusden.com (Postfix) with ESMTP id DB391162CF4
        for <linux-media@vger.kernel.org>; Sat, 25 May 2019 09:56:09 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
        id B432C160351; Sat, 25 May 2019 09:56:09 +0200 (CEST)
Date:   Sat, 25 May 2019 09:56:09 +0200
From:   folkert <folkert@vanheusden.com>
To:     linux-media@vger.kernel.org
Subject: libv4l resolution selection not working?
Message-ID: <20190525075609.l52enswewxkqvmf3@belle.intranet.vanheusden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: www.vanheusden.com
X-Chameleon-Return-To: folkert@vanheusden.com
X-Xfmail-Return-To: folkert@vanheusden.com
X-Phonenumber: +31-6-41278122
X-URL:  http://www.vanheusden.com/
X-PGP-KeyID: 1F077C42
X-GPG-fingerprint: AC89 09CE 41F2 00B4 FCF2  B174 3019 0E8C 1F28 D8AE
X-Key:  http://pgp.surfnet.nl:11371/pks/lookup?op=get&search=0x1F077C42
Read-Receipt-To: <folkert@vanheusden.com>
Reply-By: Fri May 24 13:37:36 CEST 2019
User-Agent: NeoMutt/20170306 (1.8.0)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Situation: a raspberry pi with kernel 4.9.59-v7+ and a v2 camera.

With that I do:

	struct v4l2_format fmt;
	memset(&fmt, 0x00, sizeof fmt);

	fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	fmt.fmt.pix.width       = 640;
	fmt.fmt.pix.height      = 480;
	fmt.fmt.pix.pixelformat = V4L2_PIX_FMT_RGB24;
	fmt.fmt.pix.field = V4L2_FIELD_INTERLACED;

	v4l2_ioctl(fd, VIDIOC_S_FMT, &fmt);

I would expect it to select 640x480 but instead it always it selects
3280x2464. Also with other resolutions the result is always 3280x2464.

Is this a bug in libv4l?


Folkert van Heusden
