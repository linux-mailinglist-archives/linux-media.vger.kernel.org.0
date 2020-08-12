Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85662424E5
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 06:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgHLEvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Aug 2020 00:51:24 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43541 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726017AbgHLEvY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Aug 2020 00:51:24 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 24B575C008C
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2020 00:51:23 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Wed, 12 Aug 2020 00:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm2; bh=KgiVN6qNw3AFEjPeWgeK2/Jceod0VXmpmBr5bPi5SEc=; b=dtpz3DCF
        /EPBUldGNMzpAmfZYndjsAumWhTwPjoBCA0ecQPEH10eluaRTe+9IRbMPAKccRTH
        +TslM9CeMEflJt8giDMH9C1Gs/MXMflrtA/uc5+0QfS+HL99JFk+zgLyQKS09o4w
        XMmOs1RWspUkXbVVFvDFIO2O1e+yROrWglZWSx+TlEoRZ+UktYQbhgGbkm81NsEy
        roUpLY2t83epzDRLQ2U+QmfX3o/OrgC1G+8RV0M+HXhWrREENZ7JgRWEjP9lGhi4
        +qawY4H2bZ7nFvfPyZvq2Dra5HfA8RMb999P3+THUdjjRonettyUQu3s2hiaUiLn
        QE330IJAgkoiXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=KgiVN6qNw3AFEjPeWgeK2/Jceod0V
        XmpmBr5bPi5SEc=; b=PGieIn6Adl7pc2/l70tqdl9LBOTt0jIDihH9EMiQMUvea
        gBPP679crDQkjG035OOLuIbrA/9RklrIx9y+7K3n5rMtfESIzZ6LMiq98+9mSDel
        miV8egYiTHPzBfWyE0Y42Ipz3k7dW+b9gkEgOlwQ2CpBElWDUILIkr6Z9EgCiYaU
        h84LgyGZ60SUX4L9RTI+UojvcgcnsGdkME5fKLtKBVWfuUepU0cSLPQxvEeRwDcF
        WVHJEwZnitiTBtCWN6KGPZNjqV5Y7TD2fMeA3ThyfbBNpi6YyX0lif3hTtFBCIZK
        5Sh5RUr5Fa1Aitld4PrDBJmS1d5dnd6z8n3RqsdAA==
X-ME-Sender: <xms:S3UzX_GO2tIjVuBY7WY4imW73kVsbiO_p_s-Syl6gNy4EYksj1LaUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrledugdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
    ertdenucfhrhhomhepfdfuihguucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecu
    ggftrfgrthhtvghrnhepueekheeiueeugeevvdejhfeiuefgvdekvdduvdegudfgheefve
    dtgeetvdehudetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepshhiugesrggvrghmrdhush
X-ME-Proxy: <xmx:S3UzX8V-nS8h0n3qM80GoVls7gjd5WbgXy37zcGyAi08Y0x54Z5A7w>
    <xmx:S3UzXxJQ8HBkPFXSqElmxrE0KKGczI0ahx2Y967XgD4S1khian0kkQ>
    <xmx:S3UzX9Gvva8sZC4N8ILgNoah9XXf41ORdtgZ8gQFr0aSYZrTrF4QAg>
    <xmx:S3UzX6Xm73mZemSegQrYQAhSv7LPqbcV0f-Y8TlsF8aQgtewaQlbdA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 0CB0B660081; Wed, 12 Aug 2020 00:51:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-173-g8f9f77a-fm-20200811.001-g8f9f77a0
Mime-Version: 1.0
Message-Id: <7a6e72c8-26a0-44b0-b7c2-0ebc3850bebf@www.fastmail.com>
Date:   Tue, 11 Aug 2020 23:50:59 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-media@vger.kernel.org
Subject: Intermittent Snow Instead of Picture
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I've a HDMI to USB capture card with VID:PID 534d:2109. There is no other
identifiable information.  Captures work via mpv or ffplay. Captures also
intermittently work when I use the v4l2 API directly.  If I use rust and
libv4l-rs to do my captures they typically succeed unless I fail to stop
streaming. With C the capture seems to go to fuzz even after I unplug/plug the
capture card.

Is there a list of errata for devices anywhere? Is there anything I should be
doing?

I've attached the code I am using, as stated sometimes I get real data. The
data typically plays in ffplay/mpv but is colorful snow.

===================================

```c++

#include <stdio.h>
#include <stdlib.h>

#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/select.h>
#include <sys/epoll.h>

#include <linux/videodev2.h>
#include <libv4l2.h>

int main(int argc, char *argv[]) {
	int fd = open("/dev/video0", O_RDWR);
	// TODO: Status check.
	
	struct v4l2_capability caps = { 0 };
	if (ioctl(fd, VIDIOC_QUERYCAP, &caps)) {
		perror("VIDIOC_QUERYCAP");
		exit(-1);
	}

	struct v4l2_format fmt = { 0 };
	fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	fmt.fmt.pix.pixelformat = V4L2_PIX_FMT_MJPEG;
	fmt.fmt.pix.width = 1920;
	fmt.fmt.pix.width = 1080;
	if (ioctl(fd, VIDIOC_S_FMT, &fmt)) {
		perror("VIDIOC_S_FMT");
		exit(-1);
	}

	struct v4l2_requestbuffers req = { 0 };
	req.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	req.memory = V4L2_MEMORY_MMAP;
	req.count = 1;
	if (ioctl(fd, VIDIOC_REQBUFS, &req)) {
		perror("VIDIOC_REQBUFS");
		exit(-1);
	}

	struct v4l2_buffer buf = { 0 };
	buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	buf.memory = V4L2_MEMORY_MMAP;
	buf.index = 0;
	if (ioctl(fd, VIDIOC_QUERYBUF, &buf)) {
		perror("VIDIOC_QUERYBUF");
		exit(-1);
	}

	uint8_t *buffer = (uint8_t *)mmap(NULL, buf.length, PROT_READ | PROT_WRITE, MAP_SHARED, fd, buf.m.offset);
	if (MAP_FAILED == buffer) {
		perror("mmap");
		exit(-1);
	}

	if (ioctl(fd, VIDIOC_STREAMON, &buf.type)) {
		perror("VIDIOC_STREAMON");
		exit(-1);
	}


	puts("await capture");
	fd_set fds;
	FD_ZERO(&fds);
	FD_SET(fd, &fds);
	struct timeval tv = { 0 };

	int outfd = open("output.mjpg", O_CREAT | O_WRONLY);
	if (outfd < 0) {
		perror("open");
		exit(-1);
	}

	printf("%d %d %d\n", buf.m.offset, buf.length, buf.bytesused);

	for (int i = 0; i < 600; i++) {
		if (ioctl(fd, VIDIOC_QBUF, &buf)) {
			perror("VIDIOC_QBUF");
			exit(-1);
		}

		int rc = select(fd+1, &fds, NULL, NULL, &tv);
	
		if (ioctl(fd, VIDIOC_DQBUF, &buf)) {
			perror("VIDIOC_DQBUF");
			exit(-1);
		}

		write(outfd, &buffer[buf.m.offset], buf.bytesused);
		fsync(outfd);
		printf("%d %d %d\n", buf.m.offset, buf.length, buf.bytesused);
	}

	if (-1 == ioctl(fd, VIDIOC_STREAMOFF, &buf.type)) {
		puts("VIDIOC_STREAMOFF");
	}
	close(fd);
	return 0;
}
