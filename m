Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08D16CAAA8
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 18:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbjC0Qdu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 12:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbjC0Qds (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 12:33:48 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2899E30C3
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 09:33:23 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id k14-20020a9d700e000000b0069faa923e7eso4839682otj.10
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679934802;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IVRw/y/HYv4F/ZCjc9fnnqraRDvjr9QFkV7EkmAoUoo=;
        b=NsGEwEncMw5OwrGyAcLFXDP8Nh1XLl/oTNd4e2FQL4j/+hA+bwkq0Pj3SJRWIIm+zW
         l2xdO2qqO8Q31zu3WQQ/JMeTFa2YbdHFP9Y+GJqjqimKC0l36mruXhxC2pLryxJt2/Uq
         vvmV2wsPy0VXiZPxrxnpnAn06my6RUtCE5B0tvSMUPHGTnLa/5pVa9bP6/VdpE2VkzkV
         0eMdCxJmrUeP086hZ+OHnXYvVweBZNMiacuDiiM1186YuZsHYTADalScYsJMbFwtzC7q
         7ZoILJl7e7FoFb77mTyg01zd9lQ8CxFuqIaLkO7yq2HWzh26VMMUy5SeF3kSv1hIB5ho
         Dr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679934802;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVRw/y/HYv4F/ZCjc9fnnqraRDvjr9QFkV7EkmAoUoo=;
        b=Q9JE2WMHlYVRNgPiwlx5kz2M+GeT+ywgEO1W2s3924TO/Jeq9Cgh4ImW+St0Z7tv2X
         t1MYvSia9670S8oaiJiEGc2L5XN5mjbd2juMF88XVn6js9Upy0mNiDEB14W3l05bKrrJ
         AlZo8kZbDaFCUYd1iWOLgsjPF4qvxgvqQJcVrKxloEydnqrA0uYUXKuCZJcYXjaG6lsz
         EXZ+8wUjfR0kvArDuosRem0J48OJRIrQLE8CrU+oGQak5KlBMZwfN+Nm2vYZD1u3xwvG
         U4Q3Qf0LZtKZ6cSl2KbFJGg/+Y8Yx8DRB7NTwcXpiJ6bIFrrSwKQXoNAoDaIL8yEjNEE
         4CfA==
X-Gm-Message-State: AO0yUKWZq/uJDxBrzC/Vh4z9mk4uP9GQIf1tOWEpabr8v2DgC7tchEn4
        ZEtNE51oBvPWmH3kpnvGC7mznqwSyodeenXfnBRtiJaQdpE=
X-Google-Smtp-Source: AK7set+gPLiKBGE3pPAPdXcHJboomFksbejP8LUEgDbv6mgtCdo3Wh4kfz+sXPsYdKZeFqyRS+zTh9LpAj0UMmH21mA=
X-Received: by 2002:a9d:6385:0:b0:690:c81f:d459 with SMTP id
 w5-20020a9d6385000000b00690c81fd459mr3941306otk.3.1679934802014; Mon, 27 Mar
 2023 09:33:22 -0700 (PDT)
MIME-Version: 1.0
From:   Shawn Lindberg <shawn.lindberg@gmail.com>
Date:   Mon, 27 Mar 2023 11:33:11 -0500
Message-ID: <CAC6x6ivA-zk=NG9MS7bi-_yFarhf=A1ig-Yn9NBy1QuHnN+kow@mail.gmail.com>
Subject: Extremely long delay between CEC image-view-on an standby.
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings, I am having trouble figuring out a very strange problem I'm
seeing. I have a Raspberry Pi 4B connected via HDMI to a LG projector.
I have no trouble turning the projector on using the following
commands:

cec-ctl -d0 --tv --cec-version-1.4
cec-ctl -d0 -t0 --image-view-on

I'm using CEC version 1.4 because that is what the projector supports.
I don't know whether that's necessary or contributing. However, if I
try to turn the projector off using standby, I get the following and
the projector does not turn off:

cec-ctl -d0 -t0 -T --standby
        CEC_ADAP_G_CAPS returned 0 (Success)
        CEC_ADAP_G_PHYS_ADDR returned 0 (Success)
        CEC_ADAP_G_LOG_ADDRS returned 0 (Success)
        CEC_ADAP_G_CONNECTOR_INFO returned 0 (Success)
Driver Info:
    Driver Name                : vc4_hdmi
    Adapter Name               : vc4
    Capabilities               : 0x0000011e
        Logical Addresses
        Transmit
        Passthrough
        Remote Control Support
        Connector Info
    Driver version             : 5.15.84
    Available Logical Addresses: 1
    DRM Connector Info         : card 0, connector 32
    Physical Address           : f.f.f.f
    Logical Address Mask       : 0x0000
    CEC Version                : 1.4
    Vendor ID                  : 0x000c03 (HDMI)
    OSD Name                   : 'TV'
    Logical Addresses          : 1 (Allow RC Passthrough)

      Logical Address          : Not Allocated
        Primary Device Type    : TV
        Logical Address Type   : TV


Transmit from Unregistered to TV (15 to 0):
STANDBY (0x36)
        CEC_TRANSMIT returned -1 (Machine is not on the network)

During this time, if I try to poll the projector, it will succeed.
However, if I monitor events, after a significant amount of time
(appears to be greater than 20 minutes, although this is difficult to
verify because of how long it takes) I go will eventually see the
following:

Event: State Change: PA: 1.0.0.0, LA mask: 0x0000, Conn Info: yes
    Timestamp: 30981.428s
Transmitted by Specific to Specific (14 to 14): POLL
    Tx, Not Acknowledged (4), Max Retries
    Sequence: 21 Tx Timestamp: 30981.561s Tx, Not Acknowledged (4), Max Retries

Event: State Change: PA: 1.0.0.0, LA mask: 0x4000, Conn Info: yes
    Timestamp: 30981.561s
Transmitted by Specific to all (14 to 15): REPORT_PHYSICAL_ADDR (0x84):
    phys-addr: 1.0.0.0
    prim-devtype: tv (0x00)
    Sequence: 22 Tx Timestamp: 30981.696s
Transmitted by Specific to all (14 to 15): DEVICE_VENDOR_ID (0x87):
    vendor-id: 3075 (0x00000c03)
    Sequence: 23 Tx Timestamp: 30981.835s
Received from TV to Specific (0 to 14): FEATURE_ABORT (0x00):
    abort-msg: 132 (0x84, REPORT_PHYSICAL_ADDR)
    reason: invalid-op (0x03)
    Sequence: 0 Rx Timestamp: 30981.949s
Received from TV to Specific (0 to 14): GIVE_OSD_NAME (0x46)
    Sequence: 0 Rx Timestamp: 30982.026s
Transmitted by Specific to TV (14 to 0): SET_OSD_NAME (0x47):
    name: TV
    Sequence: 24 Tx Timestamp: 30982.137s

After this point in time the standby command will succeed and the
projector will turn off. It's quite inconvenient to have to wait over
20 minutes to turn the projector back off again. Any idea how I can
shorten this delay?
