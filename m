Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602642C68DD
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 16:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731135AbgK0PkU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 10:40:20 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:38557 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730800AbgK0PkU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 10:40:20 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ifr5kXOszkGBYifr8kPwRL; Fri, 27 Nov 2020 16:40:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606491618; bh=qosT/u5aaTpIr0SLFOYSeFW3NQvYOsoZ+nN8PQrh2m8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rQ4AoSDiZddNmfyMp1JXR7W31htZnO6pw+HYyfG7W8tB0FKxlMMgFodrmL3smdCj6
         UFhxvo8aTd8Oc7bYIOm5yOFX4fedYCmRc9DRhb/eADBfWAeESjbLPwPSBpliU7TAMt
         +cJBftVK09/OFA57Vsd88AV+N4rLMYXwDUeGoIDqhxmrJqiY+tvIJ1aAAMJwm+xQC8
         GFhnGLNnw94aKEb6OcWfqkxSVdy3gcQEXCLO3AZAayq9zKdYNX8mVdR3VsKzqRiU9R
         UOOLYHhybLuZSAg2zIevvK66Rfoa4scjIJpf9IwcML4+K0MvfVq0XbKlmTEXTLPCFb
         x3uV4hq1tHLcg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.10] Two pulse8-cec fixes
Message-ID: <8b2123a2-d67a-ac8d-5764-315c50bf5486@xs4all.nl>
Date:   Fri, 27 Nov 2020 16:40:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFKATrmojTUPfraLqwFVzRByx3WqwyAa6OvYUhni8om6i/LCVaL/JS5/Q6L2aFjHBCx2BIYw0targ+YEfMp4q9LmRVp+sfT+dv8ISmL5hMqVYkykw813
 hfXstfB9JsjmxAxAfUGCWGAI2tqTDUPOQoUwL5PHybyLB64OnJkd6Xuj7WXUdZPQ66SGUUyo+rZKoUJxw2IFC6iFJ1AEyfFXRQwyGyHxJSiorbyI4/y7e0w/
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first patch fixes a kernel crash when disconnecting a Pulse-Eight
device, or simply connecting a Pulse-Eight device using a fw version >= 10.

The second patch adds support for such newer firmwares. Apparently the latest
batch of Pulse-Eight adapters us version 12, so they will currently all fail
hard.

Many thanks to Maxime for reporting this and helping to test the fixes.

Regards,

	Hans

The following changes since commit 711561a41d1f70ad939c3ff3cf00e75fa8238337:

  media: lirc: fix lirc.h documentation generation (2020-11-26 14:29:37 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10b

for you to fetch changes up to 08b96934ac224814b01408ee8cdb1fa3ec86c4a0:

  pulse8-cec: add support for FW v10 and up (2020-11-27 16:35:13 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      pulse8-cec: fix duplicate free at disconnect or probe error
      pulse8-cec: add support for FW v10 and up

 drivers/media/cec/usb/pulse8/pulse8-cec.c | 52 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 18 deletions(-)
