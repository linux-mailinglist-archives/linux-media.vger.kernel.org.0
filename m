Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB15E1165EB
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 05:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbfLIE4V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Dec 2019 23:56:21 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:38137 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726860AbfLIE4U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 8 Dec 2019 23:56:20 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:49c8:1e0e:b30e:86c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id eB5liy66lU9wBeB5miAlZ1; Mon, 09 Dec 2019 05:56:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1575867378; bh=/yMaAywPrROzv6NsBGjPVunBk7woh2T1Yvea3MOWdEM=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=F17U7aMVmXdf+RwYt9OKQ9xxkUdssYIPBr8vBc+IDv4msN8bYsHqnsVuF+JpmQlo5
         dxv28zhUtC84C4V4JtUafFqQHm1JK8vb3c5qf5qGnVh4FwTI+Zfo9SyZcXaQjAiqJn
         r5a+ONlTy/6KAEFpko7ubt/Glm2GST4KD3zzqxPxLro1W5sRgAJxh9massXZ2RzMHM
         Xnztjbhw1szvQJTbToekk50mlW22aJ4MvsD+CCkmjAH/t52Ge7IDRMxkIXeNU6xCWS
         SV+ihrkBsgNjfNNWQUKNYjV9P/NULhjpoEtFVwNJVKLBkzh5ZNM64goGXpDBQ8hl1m
         5ONESdsMHwDiA==
Message-ID: <4cba0663fce06ecebdcc5688c32076b5@smtp-cloud7.xs4all.net>
Date:   Mon, 09 Dec 2019 05:56:16 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfOiQPDMbzAyLWWRqf0RPsppGo8lVnbvm7+ML0xnAseTKsqJo12/S559XU2aDpv9NLwEt7N4/2F5LTirm4hNZhX3oCfHCUfQ1eqm8Rcek46vsWGApcqr5
 uhq4HsFUHPWCqxtN+8rYK5opqRDMGa5iSWfZHewe0A6pvrreiXzaiZnm57gwxO9OV2xFCcUW14tgEDSN3yySzwj5NAC5/1ouGgBOdvOoIUvrPmBVtxkK9ZzZ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Dec  9 05:00:12 CET 2019
media-tree git hash:	dca6b3733a4a46e63603496f544ece8ace541fde
media_build git hash:	efba365ba11b958a6bf6fb4b397942f9461cefca
v4l-utils git hash:	cb0ec2fd537333a62fa0d8e4acded7442851e956
edid-decode git hash:	46a0691551e44d49a2c3951a7d944786131c97c3
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6903fe8f5101fc43440b3259290c97d2dd51733d
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
linux-5.4-i686: OK
linux-5.4-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2793, Succeeded: 2793, Failed: 0, Warnings: 3
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
