Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60BB716167A
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgBQPpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:45:15 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:38896 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729347AbgBQPpO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:45:14 -0500
Received: by mail-wm1-f52.google.com with SMTP id a9so18968811wmj.3
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2020 07:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bk8Dl3EQzDBZc3sM1wqRJRPyzqsxBh5vDspKM3eX+so=;
        b=WNljljO+oZOXHPT7G8/wHmDUc7eXCeRSjJN8mxEjNsMl+i0BlqXbfsBXehXwW8ZRhg
         rdjDOipfVokQakn64+MAv8N/06JhT6QG37nbzXo3AZqFBVcFdrVdOSpBFx4MclIowRkC
         zCHJMXoAa+Z+cLcFx0xVXSHQWu1eBtX1ryb4a2IaEKCUJshNH4aMNPHIisVqV83gcmz+
         yYNHQpGdltRdpnxkrld/kOSYBw2HgWC8+GOBvC5myqitz4rr7o81oPlP458v13dHoFCL
         rP5KGvBVt0UUYY/PfAPy/pGhKSnuRWTPWID83uqc69GI2+V5EzuihwhO4XR90FPr2rvt
         8DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bk8Dl3EQzDBZc3sM1wqRJRPyzqsxBh5vDspKM3eX+so=;
        b=IyT+NTI3OPwNUtoKr/D4FGiFjOy9PieMy6Es7lfFWyfiB2MI7iI38Wp+HLUZ7qjHcI
         C7atNMFjI9mOdCnhl62I3W8dOcby629JaiyvhRaiLF3yk3APswxjJMNac5RTKxUVMWXa
         QnGfC1zLH0RgynwaD55q04tLEKVN7IUva2Mvv3twtnLR0cxpBy+8YBXeHxn81e/4o6aP
         90bXz8FF4G6OzPzRlOOBXUK88470XIssKi0JFO1iAeRQhKrNsorA7lz1/pzBDvZ1bBNG
         fWpuAVmimyzDUbasl8pWyWjWu6d5Hw7rewYfmOhOf9oGZqKBNojoMoZD1KjvdZcP6oEC
         Ilig==
X-Gm-Message-State: APjAAAVg4762Sm5+Kg82VAmrvrOGq847mRmQPilIrOsLecNlgU8YjcBh
        LSLfrEbkEfAivNQN7ZhJdLreFlyK
X-Google-Smtp-Source: APXvYqxsNPkGShSg1gX/ncCQ6dLNr0YQg7ZPft5wm9SohggaPkW0AhZe8qWm+XdqGRvs6lUVE4JxwQ==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr22840668wma.121.1581954312699;
        Mon, 17 Feb 2020 07:45:12 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:180d:d2d6:6ff9:a6cb])
        by smtp.gmail.com with ESMTPSA id r6sm1372658wrq.92.2020.02.17.07.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:45:12 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: RFC: Unpinned DMA-buf handling
Date:   Mon, 17 Feb 2020 16:45:04 +0100
Message-Id: <20200217154509.2265-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

hopefully the last iteration of those patches.

For now I've addressed the issue of unmapping imported BOs from the amdgpu page tables immediately by locking the page tables in place.

For HMM handling we are getting the ability to invalidate BOs without locking the VM anyway, so this last TODO will probably go away rather soon.

Place comment,
Christian.


