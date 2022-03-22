Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEF234E3BA5
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 10:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbiCVJWL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 05:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbiCVJWK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 05:22:10 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6F45C87C
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 02:20:42 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nWagy-000mNS-KE; Tue, 22 Mar 2022 09:20:40 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nWagw-00CuhB-1u; Tue, 22 Mar 2022 09:20:37 +0000
Date:   Tue, 22 Mar 2022 09:20:37 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <965521056.3.1647940837503@builder.linuxtv.org>
In-Reply-To: <1074434783.1.1647855427068@builder.linuxtv.org>
References: <1074434783.1.1647855427068@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3840
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/3840/display/redirect>

Changes:


------------------------------------------
[...truncated 62.69 KB...]
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-usb-remote.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/usb-urb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vp7045.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vp7045-fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vp702x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vp702x-fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gp8psk.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dtt200u.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dtt200u-fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dibusb-common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dibusb-mc-common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/a800.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dibusb-mb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dibusb-mc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/nova-t-usb2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/umt-010.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m920x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/digitv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxusb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxusb-analog.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ttusb2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dib0700_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dib0700_devices.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/opera1.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/af9005.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/af9005-fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/af9005-remote.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pctv452e.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dw2102.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dtv5100.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cinergyT2-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cinergyT2-fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/az6027.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/technisat-usb2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_usb_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_usb_urb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/usb_urb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/af9015.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/af9035.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/anysee.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au6610.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/az6007.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ce6230.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ec168.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lmedm04.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gl861.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl111sf.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl111sf-phy.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl111sf-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl111sf-gpio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl111sf-demod.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl111sf-tuner.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rtl28xxu.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvbsky.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/zd1301.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s2255drv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smsusb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stk-webcam.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stk-sensor.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-ttusb-budget.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ttusb_dec.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ttusbdecfe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/zr364xx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as102_drv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as102_fw.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as10x_cmd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as10x_cmd_stream.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as102_usb_drv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as10x_cmd_cfg.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/airspy.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gspca.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/autogain_functions.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/benq.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/conex.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cpia1.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dtcs033.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/etoms.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/finepix.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/jeilinj.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/jl2005bcd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/kinect.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/konica.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mars.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mr97310a.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/nw80x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov519.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov534.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov534_9.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pac207.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pac7302.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pac7311.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/se401.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sn9c2028.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sn9c20x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sonixb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sonixj.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/spca500.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/spca501.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/spca505.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/spca506.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/spca508.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/spca561.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/spca1528.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sq905.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sq905c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sq930x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sunplus.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stk014.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stk1135.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0680.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/t613.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/topro.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/touptek.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tv8532.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vc032x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vicam.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/xirlink_cit.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/zc3xx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5602_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5602_ov9650.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5602_ov7660.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5602_mt9m111.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5602_po1030.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5602_s5k83a.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5602_s5k4aa.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv06xx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv06xx_vv6410.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv06xx_hdcs.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv06xx_pb0100.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv06xx_st6422.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gl860.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gl860-mi1320.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gl860-ov2640.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gl860-ov9655.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gl860-mi2020.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hackrf.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msi2500.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pwc-if.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pwc-misc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pwc-ctrl.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pwc-v4l.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pwc-uncompress.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pwc-dec23.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pwc-dec1.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pwc-kiara.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pwc-timon.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvc_driver.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvc_queue.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvc_v4l2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvc_video.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvc_ctrl.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvc_status.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvc_isight.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvc_debugfs.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvc_metadata.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uvc_entity.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au0828-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au0828-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au0828-cards.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au0828-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au0828-video.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au0828-vbi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au0828-input.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cpia2_v4l.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cpia2_usb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cpia2_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-video.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-cards.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-avcore.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-417.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-pcb-cfg.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-vbi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-input.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-audio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx231xx-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-cards.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-camera.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-video.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-vbi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-audio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/em28xx-input.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-v4l2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-driver.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-fw.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/snd-go7007.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-usb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/go7007-loader.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s2250-board.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hdpvr-control.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hdpvr-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hdpvr-video.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/hdpvr-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-i2c-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-audio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-encoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-video-v4l.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-eeprom.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-main.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-hdw.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-v4l2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-ctrl.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-std.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-devattr.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-context.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-io.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-ioread.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-cx2584x-v4l.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-wm8775.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-cs53l32a.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-sysfs.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/pvrusb2-debugifc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stk1160-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stk1160-v4l.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stk1160-video.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stk1160-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stk1160-ac97.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-cards.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-video.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-stds.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-input.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-alsa.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tm6000-dvb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/usbtv-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/usbtv-video.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/stk1160-video.c>: In function 'stk1160_isoc_irq':
<https://builder.linuxtv.org/job/media-build/ws/v4l/stk1160-video.c>:315:2: error: implicit declaration of function 'invalidate_kernel_vmap_range' [-Werror=implicit-function-declaration]
  315 |  invalidate_kernel_vmap_range(stk_urb->transfer_buffer,
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [/usr/src/linux-headers-5.10.0-9-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/stk1160-video.o]> Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/usr/src/linux-headers-5.10.0-9-common/Makefile:1846: <https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[2]: *** [/usr/src/linux-headers-5.10.0-9-common/Makefile:185: __sub-make] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-5.10.0-9-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 533
Build step 'Execute shell' marked build as failure
