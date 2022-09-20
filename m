Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488575BE850
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 16:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiITOOE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 10:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbiITONM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 10:13:12 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625342CC87
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 07:11:24 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a26so6508000ejc.4
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=fZx/rWrR7bth2k3zX90922HeFwXDXF4+XRCwzM0uxDU=;
        b=hNs3RX9xQGVD65f7QO8VzrP4znwu+FGcrbo6ocv7O/05gKBZ1wH41NfT1tMoB9JKK+
         fCnEJGtdMDBVBXb1GRcqA66h+89xj3KHTLcreDEUobgVWQilew9i+jzjGMKG1tG/c+ds
         QX40CW1oeB2mxfZTxSz0tD36imknHdZUK16b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fZx/rWrR7bth2k3zX90922HeFwXDXF4+XRCwzM0uxDU=;
        b=nDZSelDQSxatjwo5M3dAw8LYHmc1K1vpGWfW+/4Se2hGH6LNWxEH9mIDF27SbChfs+
         jFThOuTXFhqY7EpsqzOa2jBZfuqPZP1oNeCcB5cm2fYHftGaf86qbzjI8UXwLRyyscbg
         JPon8PyQdDWrSs2ZuF4Rm25CDk5aGhFOVuILl4JKdnKWBD85Cb3cQZCyq+us2TOB/tWm
         7nAlmkc/3VMdNIhkfsrECRV8VXFjKXbiJF3wC724qDtooEpg9TofVwq2mCTejcfyAx0f
         HoD9dnhoMED4X/vijCaMTjQwhgNPrOVvuUmVy19MULpZ4Gxckp9lLB4jPDSYNsZaWnFc
         vjOA==
X-Gm-Message-State: ACrzQf3gtJX7dzB+mXHAI34WyUOaPLirzKWjPzXds7uWNIyO98kszW5S
        U3EfogdfV/vSchVegW8YIj0cQ+67/5qlvPAvK6E=
X-Google-Smtp-Source: AMsMyM49va1rmcsPaDlAugeRoY+PzfADCzIDSwOMykHAqiCqO0+W2W/625FQvzvQ7U8cpRoUv2xFOQ==
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id hy11-20020a1709068a6b00b00780ab370b63mr15122776ejc.365.1663683082739;
        Tue, 20 Sep 2022 07:11:22 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:935d:52b0:7461:88e1])
        by smtp.gmail.com with ESMTPSA id b24-20020aa7c918000000b004518ee90b4dsm129668edt.1.2022.09.20.07.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 07:11:21 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 20 Sep 2022 16:11:06 +0200
Subject: [PATCH v1 3/5] media: uvcvideo: Return -EACCES for Wrong state error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220920-resend-v4l2-compliance-v1-3-81364c15229b@chromium.org>
References: <20220920-resend-v4l2-compliance-v1-0-81364c15229b@chromium.org>
In-Reply-To: <20220920-resend-v4l2-compliance-v1-0-81364c15229b@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=l3Tve8hGJ5W5tTbag9O5QNFnAI00qvVi1fN45JRNTAM=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjKcn/J5h+0gj3RkVXT+F2wF6DERtyqXPbiyyPS7Lq
 01rqx+2JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCYynJ/wAKCRDRN9E+zzrEiHQTD/
 9ZBbIC//geY3g3ywDr6Lg3j0lkU5m5cFuiwGpZL3bDLnUZKL3tB9cmqFZQ/7+/DdRcS1r4tAb0rsWq
 1XHhHIc+sM7TEzcdm57ZzhYfopuV/68vfB6OJCwS92xPqfL162Ra/Hw75GVS0MNrF+xX6US6MnnUYX
 BD8XtqNgRvMb878fj3jVT1cpI7wqY5wYEGOh5hg672qjO5lnXBiJJDNJ9dFxA5Y32sqBqPdjde+d4x
 317Wit7YVtGnscLOwtnJquHVHK1mlclPv17aZXGiT5ja23aONAmSilXyZ9gIq1SSYOD5b9mLl7/Fx9
 B49LiMIqk/Bu0pgLxrfG7lWNJDpjwoosiCKyMjwDemlX4IH2xutfvtoJbE9C5X1FnR0Z/k5WgLXG1n
 Gi/qwNnme0/qaxzH8LtckCv03PgDdT8F0Z7hCXHH/kHIlkbJxfbz4PYloO0xVKyrAzB/28t90eylny
 xX7q5sDFzaEGFATiPrPHgxRbMNG5JO9BadznggBkBEHsPqMEfPVvAkOTNxyyKxLpg1dKVluB+dgUDw
 b6BPlBIUw9vE5vdRn2Soq7bVPLR+DffaYnFgF75zjjWTZrurbo2BKwvRjxJkfLQKfmbmYC7FD6JrvK
 sorGg3tmm1lsqmx2Eqki3JvDotU44SzDJgR9u6d61m2hvOpy7ypTvYvG/CEw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For error 2 (Wrong state) return -EACCES instead of -EILSEQ.
EACCES is a much more appropriate error code. EILSEQ will return
"Invalid or incomplete multibyte or wide character." in strerror(),
which is a *very* confusing message.

Suggested-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2cf7f692c0bb..497073a50194 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -108,7 +108,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	case 1: /* Not ready */
 		return -EBUSY;
 	case 2: /* Wrong state */
-		return -EILSEQ;
+		return -EACCES;
 	case 3: /* Power */
 		return -EREMOTE;
 	case 4: /* Out of range */

-- 
b4 0.11.0-dev-d93f8
