Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD02140AD5D
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhINMUA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:20:00 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:34036 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232658AbhINMT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:19:58 -0400
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id PpJUmKtuFczbLQ7Hfmm22H; Tue, 14 Sep 2021 12:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631621491; bh=x/7venyGQ0tYGVAkh9E329A8oJA6M+IGWstC4Bq12uM=;
        h=From:To:Cc:Subject:Date;
        b=Q8KhDtGhaogR2awXNxZRPxOJZ+sEpUIKZLT4/38eYQLgo1FKvt1XRWybqfoISgYft
         RstqOd+qryN9OrV0C70w2uCXcHxh/D4Ts18+lv4ujgxmZWqO9ffggNf7HUe9G5MNUX
         YrhEvPSsyrL36S2z5f5jgNrJ2qSVqBCKVC9QotM8or3JoIwX+f96NvxJGMEEm5W/09
         9KNCLrSYkjzrcpSy4Sz0rLrhuszNJupedwl5YGtUrrK36xXr698sDWrauCRfzNRkAf
         Leh7iplYOr+NsNcZbtiYSw/f7DTbYo+gDnaUhPyq8N4Qp4d342o+ftVL8VrK6edH3c
         YmVXgq2PeLMGQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id Q7Hdmcu7dcHSBQ7Hempuzy; Tue, 14 Sep 2021 12:11:31 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61409173
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=IkcTkHD0fZMA:10 a=EqOTydxkAAAA:20 a=zdeDSTMzysEwmB9c_NsA:9 a=QEXdDO2ut3YA:10
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 00/11] edid-decode: bug fixes, additions, changes
Date:   Tue, 14 Sep 2021 05:11:18 -0700
Message-Id: <20210914121129.51451-1-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMfJ7D/yYocdPARLTipWY2lETWSO/11IUgQMTqCiBMPR/1198GOOO/3Aps8p+yVAN9rFzx5V7LZ6kE1H2+CnDjmI4446TKHp0hyTq2Q+uXdTL9Hvdg7/
 o4Uu1i6xDCTsuZgb8547Zu0opfgrKb5srU3pnc/Hz4n3ypSMBQRVuonSfbhs9Lr/OF2RsBvpYxOH1ysmUO1ZEWAZ7IjYB5iZEQ4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset is a set of bug-fixes, additions, and changes I've made while examining various EDIDs I have encountered.

I made a fork at https://github.com/joevt/edid-decode with the commits listed below.

For the first commit, I have a script to convert C printf format strings in the source code to regular expressions and then use those to find EDIDs in my collection (or in linuxhw/EDID) that contain matches to those regular expressions that are not matched by the EDIDs in the data directory. It prioritizes EDIDs that contain the most matches.

joevt (11):
  edid-decode: add more example EDIDs
  edid-decode: ignore dSYM
  edid-decode: change install directories for macOS
  edid-decode: add bounds checking
  edid-decode: fix standard timing vertical pixels
  edid-decode: linefeed before fail
  edid-decode: always linefeed after hex_block
  edid-decode: output full frequencies for 4:2:0
  edid-decode: allow undefined aspect ratio
  edid-decode: add warnings to VESA VSDB
  edid-decode: cta and displayid changes

 .gitignore                                    |   1 +
 Makefile                                      |  22 +-
 data/_EDID_ACR_0497                           | Bin 0 -> 256 bytes
 data/_EDID_AIC_1005                           | Bin 0 -> 256 bytes
 data/_EDID_APP_921f                           | Bin 0 -> 256 bytes
 data/_EDID_APP_9220                           | Bin 0 -> 256 bytes
 data/_EDID_BNQ_802e                           | Bin 0 -> 256 bytes
 data/_EDID_CMN_152a                           | Bin 0 -> 256 bytes
 data/_EDID_CVT_0003                           | Bin 0 -> 256 bytes
 data/_EDID_DEL_0001                           | Bin 0 -> 128 bytes
 data/_EDID_DEL_a07b                           | Bin 0 -> 384 bytes
 data/_EDID_DLM_0000                           | Bin 0 -> 256 bytes
 data/_EDID_DON_0046                           | Bin 0 -> 256 bytes
 data/_EDID_DVI_0000                           | Bin 0 -> 128 bytes
 data/_EDID_ELE_0938                           | Bin 0 -> 256 bytes
 data/_EDID_GDH_0030                           | Bin 0 -> 256 bytes
 data/_EDID_GSM_0001                           | Bin 0 -> 256 bytes
 data/_EDID_GSM_5b08                           | Bin 0 -> 256 bytes
 data/_EDID_GSM_5b08_2                         | Bin 0 -> 256 bytes
 data/_EDID_HPN_3530                           | Bin 0 -> 256 bytes
 data/_EDID_HPN_3645                           | Bin 0 -> 256 bytes
 data/_EDID_HSD_03e9                           | Bin 0 -> 128 bytes
 data/_EDID_HSD_04bb                           | Bin 0 -> 128 bytes
 data/_EDID_HWP_331b                           | Bin 0 -> 256 bytes
 data/_EDID_HYO_049b                           | Bin 0 -> 256 bytes
 data/_EDID_IVM_6615                           | Bin 0 -> 256 bytes
 data/_EDID_IVM_6640                           | Bin 0 -> 256 bytes
 data/_EDID_KMR_461a                           | Bin 0 -> 256 bytes
 data/_EDID_LEN_65cf                           | Bin 0 -> 256 bytes
 data/_EDID_LEN_65ed                           | Bin 0 -> 384 bytes
 data/_EDID_LEN_b800                           | Bin 0 -> 256 bytes
 data/_EDID_LGD_05c0                           | Bin 0 -> 128 bytes
 data/_EDID_LGD_4601                           | Bin 0 -> 128 bytes
 data/_EDID_LTM_2c02                           | Bin 0 -> 256 bytes
 data/_EDID_MSI_1462                           | Bin 0 -> 256 bytes
 data/_EDID_NOV_0405                           | Bin 0 -> 256 bytes
 data/_EDID_NSO_5605                           | Bin 0 -> 128 bytes
 data/_EDID_OEC_d501                           | Bin 0 -> 128 bytes
 data/_EDID_PDI_0030                           | Bin 0 -> 128 bytes
 data/_EDID_PHL_01ea                           | Bin 0 -> 256 bytes
 data/_EDID_PHL_01ea_2                         | Bin 0 -> 256 bytes
 data/_EDID_PHL_08fa                           | Bin 0 -> 512 bytes
 data/_EDID_PHL_c193                           | Bin 0 -> 256 bytes
 data/_EDID_PIO_0000                           | Bin 0 -> 256 bytes
 data/_EDID_PKB_00f8                           | Bin 0 -> 128 bytes
 data/_EDID_RHT_1234                           | Bin 0 -> 256 bytes
 data/_EDID_RJT_003a                           | Bin 0 -> 256 bytes
 data/_EDID_SAM_08f1                           | Bin 0 -> 256 bytes
 data/_EDID_SAM_0f14                           | Bin 0 -> 256 bytes
 data/_EDID_SAM_0f99                           | Bin 0 -> 512 bytes
 data/_EDID_SAM_7004                           | Bin 0 -> 256 bytes
 data/_EDID_SAN_2400                           | Bin 0 -> 128 bytes
 data/_EDID_SCN_03ff                           | Bin 0 -> 128 bytes
 data/_EDID_SEK_0000                           | Bin 0 -> 256 bytes
 data/_EDID_SHP_1008                           | Bin 0 -> 256 bytes
 data/_EDID_SPT_1801                           | Bin 0 -> 128 bytes
 data/_EDID_SUN_058f                           | Bin 0 -> 256 bytes
 data/_EDID_TCL_5655                           | Bin 0 -> 256 bytes
 data/_EDID_TGL_00f1                           | Bin 0 -> 256 bytes
 data/_EDID_UPD_4843                           | Bin 0 -> 256 bytes
 data/_EDID_USR_0100                           | Bin 0 -> 256 bytes
 data/_EDID_VIT_03dc                           | Bin 0 -> 128 bytes
 data/_EDID_VIZ_0030                           | Bin 0 -> 128 bytes
 data/_EDID_VIZ_0067                           | Bin 0 -> 256 bytes
 data/_EDID_VIZ_0092                           | Bin 0 -> 256 bytes
 data/_EDID_VIZ_1018                           | Bin 0 -> 256 bytes
 data/_EDID_VIZ_1018_2                         | Bin 0 -> 256 bytes
 data/_EDID_VSC_0e23                           | Bin 0 -> 256 bytes
 data/_EDID_VSC_0f1e                           | Bin 0 -> 256 bytes
 data/_EDID_VSC_2034                           | Bin 0 -> 256 bytes
 data/_EDID_VSC_bd2b                           | Bin 0 -> 384 bytes
 data/_EDID_XXX_001a                           | Bin 0 -> 256 bytes
 data/_EDID_YTH_0156                           | Bin 0 -> 256 bytes
 data/_EDID_YTH_1560                           | Bin 0 -> 256 bytes
 data/acer-xb321hk-dp                          | Bin 0 -> 256 bytes
 data/acer-xv273k-corrected_difdb              | Bin 0 -> 384 bytes
 data/{acer-xv273k-dp => acer-xv273k-dp1}      | Bin
 data/acer-xv273k-dp1-corrupted                | Bin 0 -> 384 bytes
 data/acer-xv273k-dp2                          | Bin 0 -> 384 bytes
 data/acer-xv273k-dp2-corrupted                | Bin 0 -> 384 bytes
 data/acer-xv273k-hdmi1                        | Bin 0 -> 256 bytes
 data/acer-xv273k-hdmi2                        | Bin 0 -> 256 bytes
 data/aoc-c24g1-dp                             | Bin 0 -> 256 bytes
 data/aoc-c24g1-hdmi                           | Bin 0 -> 256 bytes
 .../apple-17-inch-studio-display-crt-override | Bin 0 -> 128 bytes
 data/apple-applevision-750-override           | Bin 0 -> 128 bytes
 data/apple-applevision-850-override           | Bin 0 -> 128 bytes
 data/apple-cinemahd-23-2006-dvi               | Bin 0 -> 256 bytes
 data/apple-cinemahd-23-2008-dvi               | Bin 0 -> 256 bytes
 data/apple-imac-27-inch-mid-2010              | Bin 0 -> 128 bytes
 data/apple-imac-retina-5k-27-inch-2017-tile0  | Bin 0 -> 256 bytes
 data/apple-imac-retina-5k-27-inch-2017-tile1  | Bin 0 -> 256 bytes
 data/apple-macbookpro-16inch-2019             | Bin 0 -> 256 bytes
 data/apple-xdr-5k-tile0                       | Bin 0 -> 768 bytes
 data/apple-xdr-5k-tile1                       | Bin 0 -> 512 bytes
 data/apple-xdr-6k                             | Bin 0 -> 640 bytes
 data/apple-xdr-6k-tile0                       | Bin 0 -> 896 bytes
 data/apple-xdr-6k-tile1                       | Bin 0 -> 640 bytes
 data/asus-pb287                               | Bin 0 -> 256 bytes
 data/asus-pq321-dp-tile0                      | Bin 0 -> 384 bytes
 data/asus-xg438q-dp                           | Bin 0 -> 384 bytes
 data/atlona-athd420-hdmi-override             | Bin 0 -> 256 bytes
 data/chiyakeji-r1811-dp                       | Bin 0 -> 384 bytes
 data/chiyakeji-r9a18-dp-tile1                 | Bin 0 -> 384 bytes
 data/dell-up2715k-dp1-optomedia-cmv535        | Bin 0 -> 128 bytes
 data/hisense-h9g-hdmi                         | Bin 0 -> 256 bytes
 data/kds-vs555-vga                            | Bin 0 -> 128 bytes
 data/lg-31mu97-override                       | Bin 0 -> 384 bytes
 data/lg-34gn850b-dp                           | Bin 0 -> 384 bytes
 data/lg-34wk95uw-dp                           | Bin 0 -> 384 bytes
 data/lg-34wk95uw-overlay                      | Bin 0 -> 384 bytes
 data/lg-34wk95uw-thunderbolt-dp1-tile0        | Bin 0 -> 512 bytes
 data/lg-34wk95uw-thunderbolt-dp2-tile1        | Bin 0 -> 256 bytes
 data/lg-55sj850v-hdmi                         | Bin 0 -> 256 bytes
 data/lg-c8-hdmi                               | Bin 0 -> 256 bytes
 data/lg-ultrafine-5k-v1-thunderbolt-dp1-tile0 | Bin 0 -> 384 bytes
 data/lg-ultrafine-5k-v1-thunderbolt-dp2-tile1 | Bin 0 -> 256 bytes
 data/microsoft-surfacebook                    | Bin 0 -> 128 bytes
 data/optomedia-cmv535-hdmi_dip00-v2018        | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip00-v20180312    | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip00-v20180618    | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip01-v2018        | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip01-v20180312    | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip01-v20180618    | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip10-v2018        | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip10-v20180312    | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip11-v2018        | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip11-v20180312    | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip11-v20180731    | Bin 0 -> 256 bytes
 data/panasonic-tx65gxr900-hdmi                | Bin 0 -> 256 bytes
 data/philips-ftv-hdmi1.4                      | Bin 0 -> 256 bytes
 data/philips-ftv-hdmi2.0                      | Bin 0 -> 256 bytes
 data/planar-ix2790                            | Bin 0 -> 384 bytes
 data/realtek-r9a18-hdmi                       | Bin 0 -> 256 bytes
 data/samsung-lu28r55-hdmi                     | Bin 0 -> 256 bytes
 data/samsung-q800t-hdmi2.0                    | Bin 0 -> 256 bytes
 data/samsung-q800t-hdmi2.1                    | Bin 0 -> 256 bytes
 data/samsung-q800t-hdmi2.1-game               | Bin 0 -> 256 bytes
 data/sharp-lc70uq17u-hdmi1                    | Bin 0 -> 256 bytes
 data/sharp-lc70uq17u-hdmi2                    | Bin 0 -> 256 bytes
 data/sharp-lc70uq17u-hdmi3                    | Bin 0 -> 256 bytes
 data/sharp-lc70uq17u-hdmi4                    | Bin 0 -> 256 bytes
 data/sharp-lc70uq17u-vga                      | Bin 0 -> 128 bytes
 data/sony-gdmf520-vga                         | Bin 0 -> 128 bytes
 data/sony-snyc901-override                    | Bin 0 -> 256 bytes
 data/sony-snyd301-override                    | Bin 0 -> 256 bytes
 data/sony-x900f-hdmi                          | Bin 0 -> 256 bytes
 data/vizio-e65e0-hdmi                         | Bin 0 -> 256 bytes
 data/vizio-m60c3-hdmi-onkyo-txnr555           | Bin 0 -> 256 bytes
 edid-decode.cpp                               | 109 +++-
 edid-decode.h                                 |  20 +-
 oui.h                                         |  20 +
 parse-base-block.cpp                          |   3 +-
 parse-cta-block.cpp                           | 456 ++++++----------
 parse-displayid-block.cpp                     | 512 +++++++++---------
 parse-vtb-ext-block.cpp                       |  13 +-
 156 files changed, 575 insertions(+), 581 deletions(-)
 create mode 100644 data/_EDID_ACR_0497
 create mode 100644 data/_EDID_AIC_1005
 create mode 100644 data/_EDID_APP_921f
 create mode 100644 data/_EDID_APP_9220
 create mode 100644 data/_EDID_BNQ_802e
 create mode 100644 data/_EDID_CMN_152a
 create mode 100644 data/_EDID_CVT_0003
 create mode 100644 data/_EDID_DEL_0001
 create mode 100644 data/_EDID_DEL_a07b
 create mode 100644 data/_EDID_DLM_0000
 create mode 100644 data/_EDID_DON_0046
 create mode 100644 data/_EDID_DVI_0000
 create mode 100644 data/_EDID_ELE_0938
 create mode 100644 data/_EDID_GDH_0030
 create mode 100644 data/_EDID_GSM_0001
 create mode 100644 data/_EDID_GSM_5b08
 create mode 100644 data/_EDID_GSM_5b08_2
 create mode 100644 data/_EDID_HPN_3530
 create mode 100644 data/_EDID_HPN_3645
 create mode 100644 data/_EDID_HSD_03e9
 create mode 100644 data/_EDID_HSD_04bb
 create mode 100644 data/_EDID_HWP_331b
 create mode 100644 data/_EDID_HYO_049b
 create mode 100644 data/_EDID_IVM_6615
 create mode 100644 data/_EDID_IVM_6640
 create mode 100644 data/_EDID_KMR_461a
 create mode 100644 data/_EDID_LEN_65cf
 create mode 100644 data/_EDID_LEN_65ed
 create mode 100644 data/_EDID_LEN_b800
 create mode 100644 data/_EDID_LGD_05c0
 create mode 100644 data/_EDID_LGD_4601
 create mode 100644 data/_EDID_LTM_2c02
 create mode 100644 data/_EDID_MSI_1462
 create mode 100644 data/_EDID_NOV_0405
 create mode 100644 data/_EDID_NSO_5605
 create mode 100644 data/_EDID_OEC_d501
 create mode 100644 data/_EDID_PDI_0030
 create mode 100644 data/_EDID_PHL_01ea
 create mode 100644 data/_EDID_PHL_01ea_2
 create mode 100644 data/_EDID_PHL_08fa
 create mode 100644 data/_EDID_PHL_c193
 create mode 100644 data/_EDID_PIO_0000
 create mode 100644 data/_EDID_PKB_00f8
 create mode 100644 data/_EDID_RHT_1234
 create mode 100644 data/_EDID_RJT_003a
 create mode 100644 data/_EDID_SAM_08f1
 create mode 100644 data/_EDID_SAM_0f14
 create mode 100644 data/_EDID_SAM_0f99
 create mode 100644 data/_EDID_SAM_7004
 create mode 100644 data/_EDID_SAN_2400
 create mode 100644 data/_EDID_SCN_03ff
 create mode 100644 data/_EDID_SEK_0000
 create mode 100644 data/_EDID_SHP_1008
 create mode 100644 data/_EDID_SPT_1801
 create mode 100644 data/_EDID_SUN_058f
 create mode 100644 data/_EDID_TCL_5655
 create mode 100644 data/_EDID_TGL_00f1
 create mode 100644 data/_EDID_UPD_4843
 create mode 100644 data/_EDID_USR_0100
 create mode 100644 data/_EDID_VIT_03dc
 create mode 100644 data/_EDID_VIZ_0030
 create mode 100644 data/_EDID_VIZ_0067
 create mode 100644 data/_EDID_VIZ_0092
 create mode 100644 data/_EDID_VIZ_1018
 create mode 100644 data/_EDID_VIZ_1018_2
 create mode 100644 data/_EDID_VSC_0e23
 create mode 100644 data/_EDID_VSC_0f1e
 create mode 100644 data/_EDID_VSC_2034
 create mode 100644 data/_EDID_VSC_bd2b
 create mode 100644 data/_EDID_XXX_001a
 create mode 100644 data/_EDID_YTH_0156
 create mode 100644 data/_EDID_YTH_1560
 create mode 100644 data/acer-xb321hk-dp
 create mode 100644 data/acer-xv273k-corrected_difdb
 rename data/{acer-xv273k-dp => acer-xv273k-dp1} (100%)
 create mode 100644 data/acer-xv273k-dp1-corrupted
 create mode 100644 data/acer-xv273k-dp2
 create mode 100644 data/acer-xv273k-dp2-corrupted
 create mode 100644 data/acer-xv273k-hdmi1
 create mode 100644 data/acer-xv273k-hdmi2
 create mode 100644 data/aoc-c24g1-dp
 create mode 100644 data/aoc-c24g1-hdmi
 create mode 100644 data/apple-17-inch-studio-display-crt-override
 create mode 100644 data/apple-applevision-750-override
 create mode 100644 data/apple-applevision-850-override
 create mode 100644 data/apple-cinemahd-23-2006-dvi
 create mode 100644 data/apple-cinemahd-23-2008-dvi
 create mode 100644 data/apple-imac-27-inch-mid-2010
 create mode 100644 data/apple-imac-retina-5k-27-inch-2017-tile0
 create mode 100644 data/apple-imac-retina-5k-27-inch-2017-tile1
 create mode 100644 data/apple-macbookpro-16inch-2019
 create mode 100644 data/apple-xdr-5k-tile0
 create mode 100644 data/apple-xdr-5k-tile1
 create mode 100644 data/apple-xdr-6k
 create mode 100644 data/apple-xdr-6k-tile0
 create mode 100644 data/apple-xdr-6k-tile1
 create mode 100644 data/asus-pb287
 create mode 100644 data/asus-pq321-dp-tile0
 create mode 100644 data/asus-xg438q-dp
 create mode 100644 data/atlona-athd420-hdmi-override
 create mode 100644 data/chiyakeji-r1811-dp
 create mode 100644 data/chiyakeji-r9a18-dp-tile1
 create mode 100644 data/dell-up2715k-dp1-optomedia-cmv535
 create mode 100644 data/hisense-h9g-hdmi
 create mode 100644 data/kds-vs555-vga
 create mode 100644 data/lg-31mu97-override
 create mode 100644 data/lg-34gn850b-dp
 create mode 100644 data/lg-34wk95uw-dp
 create mode 100644 data/lg-34wk95uw-overlay
 create mode 100644 data/lg-34wk95uw-thunderbolt-dp1-tile0
 create mode 100644 data/lg-34wk95uw-thunderbolt-dp2-tile1
 create mode 100644 data/lg-55sj850v-hdmi
 create mode 100644 data/lg-c8-hdmi
 create mode 100644 data/lg-ultrafine-5k-v1-thunderbolt-dp1-tile0
 create mode 100644 data/lg-ultrafine-5k-v1-thunderbolt-dp2-tile1
 create mode 100644 data/microsoft-surfacebook
 create mode 100644 data/optomedia-cmv535-hdmi_dip00-v2018
 create mode 100644 data/optomedia-cmv535-hdmi_dip00-v20180312
 create mode 100644 data/optomedia-cmv535-hdmi_dip00-v20180618
 create mode 100644 data/optomedia-cmv535-hdmi_dip01-v2018
 create mode 100644 data/optomedia-cmv535-hdmi_dip01-v20180312
 create mode 100644 data/optomedia-cmv535-hdmi_dip01-v20180618
 create mode 100644 data/optomedia-cmv535-hdmi_dip10-v2018
 create mode 100644 data/optomedia-cmv535-hdmi_dip10-v20180312
 create mode 100644 data/optomedia-cmv535-hdmi_dip11-v2018
 create mode 100644 data/optomedia-cmv535-hdmi_dip11-v20180312
 create mode 100644 data/optomedia-cmv535-hdmi_dip11-v20180731
 create mode 100644 data/panasonic-tx65gxr900-hdmi
 create mode 100644 data/philips-ftv-hdmi1.4
 create mode 100644 data/philips-ftv-hdmi2.0
 create mode 100644 data/planar-ix2790
 create mode 100644 data/realtek-r9a18-hdmi
 create mode 100644 data/samsung-lu28r55-hdmi
 create mode 100644 data/samsung-q800t-hdmi2.0
 create mode 100644 data/samsung-q800t-hdmi2.1
 create mode 100644 data/samsung-q800t-hdmi2.1-game
 create mode 100644 data/sharp-lc70uq17u-hdmi1
 create mode 100644 data/sharp-lc70uq17u-hdmi2
 create mode 100644 data/sharp-lc70uq17u-hdmi3
 create mode 100644 data/sharp-lc70uq17u-hdmi4
 create mode 100644 data/sharp-lc70uq17u-vga
 create mode 100644 data/sony-gdmf520-vga
 create mode 100644 data/sony-snyc901-override
 create mode 100644 data/sony-snyd301-override
 create mode 100644 data/sony-x900f-hdmi
 create mode 100644 data/vizio-e65e0-hdmi
 create mode 100644 data/vizio-m60c3-hdmi-onkyo-txnr555
 create mode 100644 oui.h

-- 
2.24.3 (Apple Git-128)

