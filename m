Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92655DE2D0
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 05:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfJUDxe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Oct 2019 23:53:34 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:60567 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726819AbfJUDxe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Oct 2019 23:53:34 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:ddc3:e329:c51d:b83f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id MOl6iqMxUPduvMOl8iCSdt; Mon, 21 Oct 2019 05:53:30 +0200
Message-ID: <022470855b40a3dbe34a46658684b234@smtp-cloud8.xs4all.net>
Date:   Mon, 21 Oct 2019 05:53:28 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
X-CMAE-Envelope: MS4wfEgmZwgHYh0RzrFn4xQ/dpo4VZ3vwnkYvKbPIk/GDpzGyJr7l5ICplVwmO1d5G6Z1Wx8atUUnEVZBxCoSq85o3Fdx15kbqN6h7vkmqhQI0hPa8nHO5jJ
 X1QRD91eNSUUux2JveQQS/IsWmp/fgV8418juN/+xTjml0gxjWlDn9DPIgvXlUWAWVqf6rVdM6vmMnlbdXRD2/HfvF/oJMsLm7VroL8hYfPbHQgluTURBRiF
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Oct 21 05:00:10 CEST 2019
media-tree git hash:	4b1d7c2760d26363c497b959a81f8d055ba767c1
media_build git hash:	afb27b4820fd670aed06d56c6a1dde56318453f1
v4l-utils git hash:	3e4eb8fbfcada0c7f3d1b5a7ee69270ee83bfc07
edid-decode git hash:	dc8afbf7e3001587e27695288ff8c259249256b1
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1-rc1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		(null): (null):0 (null)() warn: /home/hans/share/smatch/smatch_data/ is not accessible.
(null): (null):0 (null)() warn: Use --no-data or --data to suppress this message.
0.5.1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: fb74d4453fd4f857830399be9778a571221bee04
host hardware:		x86_64
host os:		5.2.0-3-amd64

linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-multi: OK
linux-git-arm-pxa: OK
linux-git-arm-stm32: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-mips: OK
linux-git-powerpc64: OK
linux-git-sh: OK
linux-git-x86_64: OK
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
linux-3.16.63-i686: OK
linux-3.16.63-x86_64: OK
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
linux-4.4.167-i686: OK
linux-4.4.167-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.162-i686: OK
linux-4.9.162-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.105-i686: OK
linux-4.14.105-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.28-i686: OK
linux-4.19.28-x86_64: OK
linux-4.20.15-i686: OK
linux-4.20.15-x86_64: OK
linux-5.0.15-i686: OK
linux-5.0.15-x86_64: OK
linux-5.1.1-i686: OK
linux-5.1.1-x86_64: OK
linux-5.2.1-i686: OK
linux-5.2.1-x86_64: OK
linux-5.3.1-i686: OK
linux-5.3.1-x86_64: OK
linux-5.4-rc1-i686: OK
linux-5.4-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2327, Succeeded: 2327, Failed: 0, Warnings: 0
sparse: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
