Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073F92A23CB
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 05:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727694AbgKBEjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 23:39:45 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:48135 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727620AbgKBEjp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 23:39:45 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZRd7kh2JB1KUMZRd8k5eS5; Mon, 02 Nov 2020 05:39:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604291982; bh=DZxel8oHk2phyWAsrLpkSW36a2gVzVy9atraZZGeZkg=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=DeqAgzqWSaKQMI9jwdbIWdZo0AC8jpDq7uyykXK5W7N0Dckr30iV63ZkNgr2U+83o
         uSgyj60Pxx8rV2spWuixRXF91vhiwAo23D1xwZk1agF23BjXvFbC4sHjLYvpXvZLcf
         s0aoa+b1k+U8vge9gHhpfYz0FAPWhc04HX+T/SMKismfBcuQ06xoZP0kam9gFu0eyb
         Srk+QbCsR1odtQ4wIDWA9LhzpkeKzti8sh1C8kHX5mMlnYF4IDA3oSg5doutFKgQvL
         8AdOY4y5EI0Yj5Eqa8imfBD/6jYa0G50m5rZpbqY/tYz0n9yThaYBCYZ1pXqXRZPPf
         IKUP+/WPDji6Q==
Message-ID: <49eb24c862e1e5187448791464dbbefb@smtp-cloud7.xs4all.net>
Date:   Mon, 02 Nov 2020 05:39:41 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfHY+OWzt+qwKaOqXxAronueybHLi4o+CJvhMhdhsPLQHIv1Mw6QMNIkXTcfQQrKMz9yLcT21xQr7+aDlO2Ym95QoFnXsfIbjJxn9iAE5qXKFiJAT/Uub
 90/uLIx2lBykN3Y9QIDyssc6yZiWtRp9+qd7J8QwaLDscXH0mjfkW7IFwTRG0eqvVB3IxC9XAH9yH1N0oDGuAutU8eHirnMMCYFIU8UdptJBirEMb0fGhMgk
 r/rg0rhXzklPcNqK/UPfDA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Nov  2 05:00:15 CET 2020
media-tree git hash:	dfe3d19bd092cefb184c6e65b881602c793edd33
media_build git hash:	b5733d0fdc887a215d63eba10c1789e836625975
v4l-utils git hash:	225c6c2a17bec0e07c13ebb891e062ccef051180
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6793-g0248ebb06
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 5aabc25fda7a7122487b4bd429b4c635cb4df7d7
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-x86_64: OK
linux-git-i686: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-3.10.108-i686: OK
linux-3.10.108-x86_64: OK
linux-3.11.10-i686: OK
linux-3.11.10-x86_64: OK
linux-3.12.74-i686: OK
linux-3.12.74-x86_64: OK
linux-3.13.11-i686: OK
linux-3.13.11-x86_64: OK
linux-3.14.79-i686: OK
linux-3.14.79-x86_64: OK
linux-3.15.10-i686: OK
linux-3.15.10-x86_64: OK
linux-3.16.81-i686: OK
linux-3.16.81-x86_64: OK
linux-3.17.8-i686: OK
linux-3.17.8-x86_64: OK
linux-3.18.136-i686: OK
linux-3.18.136-x86_64: OK
linux-3.19.8-i686: OK
linux-3.19.8-x86_64: OK
linux-4.0.9-i686: OK
linux-4.0.9-x86_64: OK
linux-4.1.52-i686: OK
linux-4.1.52-x86_64: OK
linux-4.2.8-i686: OK
linux-4.2.8-x86_64: OK
linux-4.3.6-i686: OK
linux-4.3.6-x86_64: OK
linux-4.4.238-i686: OK
linux-4.4.238-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.238-i686: OK
linux-4.9.238-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.200-i686: OK
linux-4.14.200-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.149-i686: OK
linux-4.19.149-x86_64: OK
linux-4.20.17-i686: OK
linux-4.20.17-x86_64: OK
linux-5.0.21-i686: OK
linux-5.0.21-x86_64: OK
linux-5.1.21-i686: OK
linux-5.1.21-x86_64: OK
linux-5.2.21-i686: OK
linux-5.2.21-x86_64: OK
linux-5.3.18-i686: OK
linux-5.3.18-x86_64: OK
linux-5.4.69-i686: OK
linux-5.4.69-x86_64: OK
linux-5.5.19-i686: OK
linux-5.5.19-x86_64: OK
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.13-i686: OK
linux-5.8.13-x86_64: OK
linux-5.9.1-i686: OK
linux-5.9.1-x86_64: OK
linux-5.10-rc1-i686: OK
linux-5.10-rc1-x86_64: WARNINGS
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 4
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 3
sparse: OK
smatch: OK

Logs weren't copied as they are too large (1448 kB)

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
