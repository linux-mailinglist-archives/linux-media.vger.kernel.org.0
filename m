Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F212B23C5
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 18:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbfIMQAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 12:00:47 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:34107 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728811AbfIMQAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 12:00:47 -0400
Received: by mail-wm1-f45.google.com with SMTP id y135so2195279wmc.1
        for <linux-media@vger.kernel.org>; Fri, 13 Sep 2019 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=TQ9S2SfWldFr+frCa8sxRC7W5KHZdghgrQ2AK1LCvPg=;
        b=AFMSDeydASsfvc8KmNLtTuJsOd79G4xhc6q334SJK20IDrEwB08LBcaLvoWkGPxbZZ
         exWT+HXSaHiwPU2Dk5pW7TbFVK1gqgYq8OCJCYyf6CpKyCFC2tKgqmBuOaSUKZIrbw4f
         g60JHzcvVAcVcsl3jWVkYRmadUrK8gVpXlvwJXDmfbjuXRZKOBorqu5VO8GiXKlPFApI
         UytURIIX2q9A6CvIIhjZ5UeiYKxJmau70KQRbveLE2vc0fZz+n3xEz6WbgQuvRQBk/g9
         usgQa/CJJqtLOQGVwvkH+iUzbJ0Dwoz7kqpGA/p1f7wkCPfvffrFlPB1akYL2JGNSNqW
         OJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=TQ9S2SfWldFr+frCa8sxRC7W5KHZdghgrQ2AK1LCvPg=;
        b=CKX20sjb48Tg/roQ6u9iQPHtwn7LmItblgq74Sr3amn6UI56ff/TxTiob2jIVg4gTn
         hic5lkIbQg9zlobwiS+T2U149+zwCbCvhoP96ZeabGlJpUUdI4UF2EC5ul4T+EKVbpHK
         hqAHLHiemiIjZ+AONWQQ+CUlLMjjR6ZZpaZcmhFP/5S+osZyXJ3Akx0DTlBu4ve3UqJy
         OJ9nJZLuGA+AQSFO0bES0Bp//EL7rJ6hYMFDI2S1gQuFTSv6nuuIO6dE2ntLnC3GkpHI
         Ez24NkvAjNb2iy2kd5X56ERb+GtgBzngiRyYaScRzmCls3hobzsf+9LKO8LRGJAiNZkU
         nfSw==
X-Gm-Message-State: APjAAAWnOumjYq+Bubok1lo8/k8CC3JkCl0l5CxdtmufLFPuijqNGg5Z
        zNB7lldRL9DyxWwPmjSe3QRogn4gVQgQPBB93rRf2CTd
X-Google-Smtp-Source: APXvYqx6zSTbQKGhJad9BNZtXA1gqZewMFHGAO8fJ5LYNP+ceSVgHAY7LEJYxP2Ij41SnwoOetOCXTZIpumBj/BiECQ=
X-Received: by 2002:a1c:c00e:: with SMTP id q14mr4260803wmf.14.1568390443789;
 Fri, 13 Sep 2019 09:00:43 -0700 (PDT)
MIME-Version: 1.0
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 13 Sep 2019 09:00:32 -0700
Message-ID: <CAJ+vNU1F0OU6j9ZbQyXwuc1JbEYrbOEK0h7hHBf-VhWrefhvpw@mail.gmail.com>
Subject: coda9 jpeg support?
To:     linux-media <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings,

What would need to be done to support JPEG enc/dec for coda9?

Best Regards,

Tim
