Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C98915D432
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 09:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgBNI6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 03:58:14 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35183 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgBNI6O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 03:58:14 -0500
Received: by mail-wr1-f68.google.com with SMTP id w12so9972164wrt.2;
        Fri, 14 Feb 2020 00:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Irc90DN0i25mcUWnLAY9jN+3gV3ff2V6EdTyREmtBhE=;
        b=MhpUMtp2apgY8D8kmzQUyar86n+3R9c9/kRmQDn3d0qgrykpbmz0su5D/DkMPPYOf5
         fQ4dYJ6eb1+0zv7soSO8uK1W5jW3PMrM8YqDT3j/hxZEdc+48Fa706AjpEAqQYpHk00I
         IIQ1RPK34q5OAIGa6Q0DLneHjD+3MDAsZpJGNp35CdUZh4/I4Erk7j31lWYkAqldxyOu
         nAeNR8F5gdu3Pgjf0xTkgdxhVnoBdPrfflET7Zf659LQt/SvnwxG4mlSydozeNxHR8w7
         62jWOrod9gOq/82kEJ7hRL1LkMUJcZ8vdmpNZmwZIa3OMeLTMsIK2rRoxOehN1rzWX06
         Y7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Irc90DN0i25mcUWnLAY9jN+3gV3ff2V6EdTyREmtBhE=;
        b=MP6OXNVFyjMWOM3FP3Yn4XtemBAPp6ze9PdkjIC2ZaI6gbZPeKFjjro0UB2oy4coyr
         3Uu/8bZjJ/hVtMWui+5sG2GaAOaRXzforSpE250YDRE3CeQe87ugZsUHuxCKvQZKpjbi
         qK7PiBaZjfChYp4ZGoN+ngrjkc0unmrmQ/gy4iG3bkMFl4rPlpimDzV5W7NfCFJPYVfV
         L7RBsQL90CypE5Zj+J6rtZ+kJHBmdjGJWIR42fp7jaBo493E2DDT4XRCjQdm9bf6Gyx1
         7AAlB62uZJByt7hyZlxEkA3IFiUt1X/oTuZ6qhbgGH6RUVVD21QXfBZYBJh3nlSkll9N
         jz0Q==
X-Gm-Message-State: APjAAAUcYwS7IwsADTsOnVPflwaXaX5BSjx4ifW9h6v8ekBAPbZXyaiF
        uL2/3XNaOJCV7doyM5lyQrj29h/K
X-Google-Smtp-Source: APXvYqxCKt3cCV/56HGkS2Sfu0F9XYisTXgYw9P466q6HqRPWnVlZJZH976Oc0JLl6CqaWPZWyz3Ng==
X-Received: by 2002:adf:9427:: with SMTP id 36mr2978504wrq.166.1581670692639;
        Fri, 14 Feb 2020 00:58:12 -0800 (PST)
Received: from localhost ([37.237.208.38])
        by smtp.gmail.com with ESMTPSA id n8sm6004306wrx.42.2020.02.14.00.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 00:58:12 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: media: add new kii pro key map
Date:   Fri, 14 Feb 2020 11:58:01 +0300
Message-Id: <20200214085802.28742-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new entry for rc-videostrong-kii-pro in linux,rc-map-name

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/media/rc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index a64ee038d235..b27c9385d490 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -143,6 +143,7 @@ properties:
           - rc-videomate-k100
           - rc-videomate-s350
           - rc-videomate-tv-pvr
+          - rc-videostrong-kii-pro
           - rc-wetek-hub
           - rc-wetek-play2
           - rc-winfast
--
2.25.0

