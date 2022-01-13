Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06F248D2C5
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 08:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbiAMHZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 02:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbiAMHZD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 02:25:03 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A476EC06173F
        for <linux-media@vger.kernel.org>; Wed, 12 Jan 2022 23:25:03 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id z22so12022571ybi.11
        for <linux-media@vger.kernel.org>; Wed, 12 Jan 2022 23:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=NNLomldTLXzZkKzvhuIvT0B+QcFkXoBDwKjq+GKGx38=;
        b=GeFZsrxi7yEuSJzMI3aoJ7aAd/GTf6Og5cJ3MxB9tgBXptANi99ChATFK5asaXxrG5
         MzfAJDL5toA+IT8B1ycIHVAWLb4tGYLN3aIJG3QqUbB9RBUbhwToLiGwWvi2zCYpl4OW
         W0Hbv9WXmRObRFCyPDvj1f3scFml+2Am3AhVbQ+jNq8OD7P8il6iPoioM2I7Dan45QVm
         H3F3CKZzZt9M5W4xjoeyhrV+EyTIzUFmDY0yGPu4MfG/eMXzGMgrl++whq7LBPEe2WLq
         4crxzDwEwAS21tdHxZJtYHJAq+yb/lagUITwXloFlmtRRxmc/C72t4pPbNSFIUXSlLD/
         Ohaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=NNLomldTLXzZkKzvhuIvT0B+QcFkXoBDwKjq+GKGx38=;
        b=fLqOvM3QyGSLJoZrdeXq/y7cje9gSf0RA5pcKKI7ePt8AYieHyVXGqCZlO5+0F2fTu
         BC/ti1tBEVkMA0rE/TojeydHxDg/mIICJ3oqS6dOBq5/GnCwyqkqrjTNBhZt89kuv+Rz
         wuvIfOKaHNWfWVqhxmHB37glD7nkAz4UM8Ia2aV+S+BoJ2oz0oJb6FX0bRailMXYRjnD
         21fZC9ZduhBIv+FgquPX2W6BSJDlQ+7YsEbTBG7UBWzFKG10BPQEQuRbK5hp8VhPnMmP
         YDDajjLdoQaeClI5alsTDav6ykDpVqMk2kJuPINOuwlEmOA0eFQgGFS4jjsHn74IKXyw
         txgw==
X-Gm-Message-State: AOAM531UcxLopDk8eB1f6mS5OXwzSc5Ke+h0M8VN3L0Q9pNxKrpfp5Rf
        XHdi+detgtaA1XotlCjmwjICmqJHXQndfjH7pZs=
X-Google-Smtp-Source: ABdhPJzS0toDHd65iz2VXc9tIOaX6vKjMcuZst5+EhU7od6hxUVRa7BtffOVbiVYWpV6h2z+cCWPM1yaf0qbqRPan8k=
X-Received: by 2002:a25:da46:: with SMTP id n67mr4422387ybf.325.1642058702863;
 Wed, 12 Jan 2022 23:25:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:a51b:b0:1e5:bd9a:d2c1 with HTTP; Wed, 12 Jan 2022
 23:25:02 -0800 (PST)
Reply-To: gabrieledgal47@gmail.com
In-Reply-To: <CAGW3=92ObaZ0AaDiBViu6AceU1+oTW=Uw0KXNVLpUikYnyTB7Q@mail.gmail.com>
References: <CAGW3=93rbecitBo=BqVeBLyPwRgv5TAw5C5ZoDZ+vr9rTDGjWQ@mail.gmail.com>
 <CAGW3=92ObaZ0AaDiBViu6AceU1+oTW=Uw0KXNVLpUikYnyTB7Q@mail.gmail.com>
From:   Gabriel Edgal <mrphillipknight@gmail.com>
Date:   Wed, 12 Jan 2022 23:25:02 -0800
Message-ID: <CAGW3=93QvcZH4Xq=i-5GZHm1TwoAbFkJb=Mt_64=-xAgCXz3XQ@mail.gmail.com>
Subject: NICE TO MEET
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear friend.

I'm Mr. Gabriel Edgal, I'm the chief internal auditor of Btci Bank, I have
an abandoned fund $ 9.5 million dollars to transfer to you, as we shall
parts 50:50. You will only stand as a relative of my deceased client as
bears the same surname as you, the fund was deposited in our bank for
many years back by my deceased client who died with his whole
family in a car accident in 2010. I would like to invite you as a foreigner
partner to stand as the next of kin of the deceased client, so that we
will place a claim on the deposited fund and divide it between the two
of
us 50:50 each. I want you to answer me immediately for more information


With best regards,
Mr. Gabriel Edgal
