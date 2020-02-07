Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBBCB15531A
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 08:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgBGHkq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 02:40:46 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36561 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgBGHkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Feb 2020 02:40:46 -0500
Received: by mail-pl1-f196.google.com with SMTP id a6so658472plm.3
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 23:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9x3wiLa8nMck6bJR/xTvEfW1fgE8xeUy0DtSaO8sY4E=;
        b=LSFFgD4Amj8tYbW+x3ruwRO2vwL5fhAS6Q9E02+ZyFILW3OJ1WR15+2ePqwzSiQKcA
         ccOfxGP84Ze4Hn0ILpj22rELuw2S6G/S5sBTirowvoPJuUSm0mz85hsi0BBbbQbWTZD/
         OB9cSDNh3vDk52tKXJdE8ZzR6XkO9zA2DQY8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9x3wiLa8nMck6bJR/xTvEfW1fgE8xeUy0DtSaO8sY4E=;
        b=iV62g+pY3Mhx9tHH+5CJDDD0bsbRipFGvNS5z7Y64aveBvhWUuPpbLmWjU4hTDfIV8
         Iuf76SmcUKuVnMrR8hf3uqu6/WzRMjEcU6nGcHADlwjRUcLxmK1mfLvxchyA2JnfRA3Z
         1W+O4/x9CESEYWr94jvEjzCEC4ZyjODT4XhzEg2o+F5mdL4q1VYDiHlHPjstcgWwgDVQ
         ttUIxqvHOPB8GG/vUwluTOHWu/ptHTvNPAwVublkSS47L7gfD10My8lfjj/hBDgTCL5v
         ejT1tpVa9Q+LFDh49JYVRKtHD3uzPQjFM2yAySqZZ5FEVDkb+pUDHeUPBb5qEvEse58c
         MTIA==
X-Gm-Message-State: APjAAAXhyIBcHK4klUYkoZzeoMSBfg6g8qdOCC/jOmJinKE5J8CYLgC0
        D7mQInZjabUGhC6cusGdbj9P1A==
X-Google-Smtp-Source: APXvYqxI87m2j612o5zsvUs0WmCZeZTRgBEcpnZL7Nxm+UI5+5ILaps1qKJlVLEUiCpW1J0pfypgeA==
X-Received: by 2002:a17:90a:ac02:: with SMTP id o2mr2337469pjq.93.1581061245512;
        Thu, 06 Feb 2020 23:40:45 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:1f16:51f4:8631:68b2])
        by smtp.gmail.com with ESMTPSA id b21sm1862887pfp.0.2020.02.06.23.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 23:40:45 -0800 (PST)
From:   David Stevens <stevensd@chromium.org>
To:     virtio-comment@lists.oasis-open.org
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        David Stevens <stevensd@chromium.org>
Subject: [RFC PATCH v3 0/2] Cross-device resource sharing
Date:   Fri,  7 Feb 2020 16:40:31 +0900
Message-Id: <20200207074033.172289-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This is the next iteration of patches for adding support for sharing
resources between different virtio devices. In addition to these
patches, the most recent virtio-video patchset includes a patch for
importing objects into that device [1].

[1] https://markmail.org/message/wxdne5re7aaugbjg

Changes v2 -> v3:
* Replace references to guest/host
* Remove unnecessary paragraph and field in exported object section
* Recommend RFC4122 version 4 UUIDs
* Represent UUID as u8[16] instead of le64 pair

David Stevens (2):
  content: define what an exported object is
  virtio-gpu: add the ability to export resources

 content.tex      | 12 ++++++++++++
 introduction.tex |  4 ++++
 virtio-gpu.tex   | 29 +++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

-- 
2.25.0.341.g760bfbb309-goog

