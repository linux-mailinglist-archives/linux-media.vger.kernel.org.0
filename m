Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71E8D181A42
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729745AbgCKNwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:52:04 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:33083 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729732AbgCKNwD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:52:03 -0400
Received: by mail-wr1-f52.google.com with SMTP id a25so2739223wrd.0
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PhxfGnB0bi/gRdfMRgwxp+GcrZerOX4kQOU9IbhHZA=;
        b=uZJqsWiKmHaq4ziRnRmLD0zId8jDdq//XwQSURKrW6HCp0ReQQTdOC70oLGSikpvwM
         5E8UySIgODRaQdQ5Y4RoJyV9l1IHE+0oXdWGgNTeUits8dXoHcyembmkwHmd4pO5N5kn
         3um9IGA5aH7Qt1xiJXxLeVz5dufMWH044EJVRfDVnxCYXUV7LGOsYYLL2/NYXNnJAMRb
         y45XsVAFdukVpXLyC1C2dbkZJIz/OpsKDvCXhiNaOCQo9yq49cwyxpSyTjFyx1G0Hcv9
         eEDusp5gX1/6dYKID6wOKlL2CcbbSIYEQ9oiXNUEkx+ela4QTqu6L5xlZ7x7XQ4sgTXP
         iRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PhxfGnB0bi/gRdfMRgwxp+GcrZerOX4kQOU9IbhHZA=;
        b=qwFIHyOMHCEbE46n3wUT1mudhYYbc8P5wMadDFhSVU1eeQFOafYKcpifEISLvawRhE
         +dgmBqya/cOo4oo6kUtn1C7ggY/NL4uoUI52LrkAzeLj8QKroWstsF0CXqcYXaBbClk8
         OujO0ikVVKKi4cRqkru8QnSYcoqlFcDhttgQFaXqEokpXLNQ0+8kkeJ/pE7hOt4B3Cvo
         /+4AY6/FFmMVsSguSLHINP88Yqae3O6YlgMmaG14FW7VnlQD3M7aeGbDytz7ET2NgZbQ
         9K6Rdmie383NubKiTmqY/msvU+9tDfho6jQhiyQ0OTalqlaCo7qqlhYtV+bqvNZP73so
         AjEw==
X-Gm-Message-State: ANhLgQ0OiUKHOWqOypr+Whl38j0AT5ET0tG6bIf4JV2Ehv97cAQN0dxL
        3iGJ0TljSkLCuWZBo7Gv0TQ=
X-Google-Smtp-Source: ADFU+vsbcw4rcvimyCnA6PJVUVnMRN0NAEKodMUwcQvB+YmthLNI/yMnz9IvZqCGyifYCK9lhcBn7g==
X-Received: by 2002:a5d:56ca:: with SMTP id m10mr4782708wrw.313.1583934720965;
        Wed, 11 Mar 2020 06:52:00 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
        by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 06:52:00 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: P2P for DMA-buf
Date:   Wed, 11 Mar 2020 14:51:52 +0100
Message-Id: <20200311135158.3310-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is the third and final part of my series to start supporting P2P with DMA-buf.

The implementation is straight forward, apart from a helper to aid constructing scatterlists without having struct pages we only add a new flag indicating that an DMA-buf importer can handle peer2peer.

The exporter can then check if P2P is general possible using the pci_p2pdma_distance_many() function and if necessary can also clear the flag.

The rest is an example how to implementing the necessary functionality into the amdgpu driver to setup scatterlists pointing to device memory.

Please review and comment,
Christian.


