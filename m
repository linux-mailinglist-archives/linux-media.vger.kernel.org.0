Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1116640AD5F
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbhINMUB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:20:01 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:37605 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232671AbhINMT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:19:59 -0400
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id PpLxmzRdwps7PQ7HgmGPUK; Tue, 14 Sep 2021 12:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631621492; bh=YzyWdYjb7F903+juCC3HJqu7juXZ6UoHM4LkBGugHJc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=da9qYtxKbaQ00B4aNihghmSZWmtsRh48wCdPEXVV2TEPp9Ku+j88f4y6cGlmu1VQL
         8vDIei90Kx5kCjaaF0dpKk473dqdocqS7cmg1X9hWd+hgXgFZTSOxmfuOrqEavmjB2
         ZDM0V9aqUYSUJySEugXlZ6d9eGpeAnzpWlq+H3MEA69GVCx2+ZqnaCuEZ6UhKUBkhD
         w2qJXQzlfM1/MIuHEVE+FhW4F3tgCrsb/GgUz2jSfg0n02kwpygXrr0jq53vyjffPo
         /eIjzlyySFbE04psN2c/d5BMBga7KZ+xT/QV9mFCslYABvfZamVJlx7gVU6XM8nN7/
         QqZbnza01nutw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id Q7Hdmcu7dcHSBQ7Hfmpv03; Tue, 14 Sep 2021 12:11:32 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61409174
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=IkcTkHD0fZMA:10 a=Tau1HEJIAAAA:20 a=_Dj-zB-qAAAA:8 a=lO4TTVcafzBeWrLYzRkA:9
 a=QEXdDO2ut3YA:10 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 01/11] edid-decode: add more example EDIDs
Date:   Tue, 14 Sep 2021 05:11:19 -0700
Message-Id: <20210914121129.51451-2-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210914121129.51451-1-joevt@shaw.ca>
References: <20210914121129.51451-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPkXWbOOfK4A6cN+DrysUdAbwD5jgWaQVFYksWb+cv9aJ/80adDtYY7J5G2KhTBRwtO9HLBzToQq3Rex2r3ZZWgbrO8G0Di6TANazfuGWTW7WJQWlXKx
 776QGoH9LciKSuqH+PGshIgfk+J1FRFW8j1u3APrkR8pOtYz1WSpGv+2q2jGplQ++lJA1mdBeXOOZglMAPmZQPo58CL1Qr4E7as=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

_EDID_AAA_0000
- EDIDs with names of this format are from https://github.com/linuxhw/EDID
- These EDIDs contain strings not seen in the other EDIDs of the data directory.
- AAA is the vendor ID.
- 0000 is the product ID.

acer-xb321hk-dp
- Acer Predator XB321HK
- This is a G-Sync display. Contains an NVIDIA VSDB.

acer-xv273k-dp1
acer-xv273k-dp2
- Acer XV273K DisplayPort 1.4 inputs when 4K 144K mode is disabled.

acer-xv273k-hdmi1
acer-xv273k-hdmi2
- Acer XV273K HDMI 2.0 inputs.

acer-xv273k-corrected_difdb
- Contains a corrected Display Interface Features Data Block for the Acer XV273K.

acer-xv273k-dp1-corrupted
- Sometimes the 3rd block of DisplayPort EDID from XV273K is a copy of the first or second block.
- Example of "Unknown Extension Block."

acer-xv273k-dp2-corrupted
- Sometimes the 3rd block of DisplayPort EDID from XV273K is a copy of the first or second block.
- Example of "Only one instance of this Data Block is allowed."

aoc-c24g1
- AOC C24G1

apple-17-inch-studio-display-crt-override
- macOS override for the 17 inch Studio Display (CRT).

apple-applevision-850-override
- macOS override for the AppleVision/ColorSync 850 Display

apple-applevision-750-override
- macOS override for the AppleVision/ColorSync 750 Display

apple-cinemahd-23-2008-dvi
- Apple Cinema HD Display, 23 inch, aluminum. This 2008 version supports HDCP.

apple-cinemahd-23-2006-dvi
- Apple Cinema HD Display, 23 inch, aluminum. This 2006 version does not support HDCP.

apple-imac-27-inch-mid-2010
- iMac (27-inch, Mid 2010)
- Example of "Monitor descriptor block has byte 4 nonzero".

apple-imac-retina-5k-27-inch-2017
- iMac (Retina 5K, 27-inch, 2017)
- Contains a dual-tile 5K display.
- Apple VSDB type 1 appears to be constant between different iMacs (sample size of 2)
- Color characteristics for red and blue may vary between different iMacs. Not sure about white and green.

apple-macbookpro-16-inch-2019
- MacBook Pro (16-inch, 2019)
- The EDID may contain different values for Color Characteristics: blue (0.0488, 0.0527, 0.0537, 0.0546)
- Apple VSDB type 3 contains a display panel model number (LP160WT1-SJA1, LP160WT1-SJA2, LP160WT1-SJA3, LP160WT1-SJA4) and some kind of serial number.
- Apple VSDB type 2 contains unknown data that varies.

apple-xdr-5k-tile0
apple-xdr-5k-tile1
- Apple Pro Display XDR. These EDIDs may be used for 6K single tile mode or 5K tiled mode (Thunderbolt connection).
- The Tiled Display Topology has info for 6K tiled but the tiled timings are sized for 5K. Apple uses an mtdd file for tile information.

apple-xdr-6k
- Apple Pro Display XDR. This EDID may be used for 6K. It contains no tile topology or tile timings.

apple-xdr-6k-tile0
apple-xdr-6k-tile1
- These EDIDs may be used for tiled 6K mode (two HBR3 x4 signals over Thunderbolt 3 with no DSC).
- Largest EDID ever with 6 extension blocks.
- Has one 60Hz mode for 1440p (for DisplayPort 1.1 compatibility) and five refresh rates for each of 4K, 5K, 6K, 5K/2 tiled modes, 6K/2 tiled modes.
- The five refresh rates are for 47.95, 48, 50, 59.94, 60Hz.
- For each resolution, only the delay between frames (just the vertical front porch) is different between different refresh rates.
- Tile topology has info for 6K tiled mode only, not 5K tiled mode even though 5K tile timings are also included.

For any of xdr EDIDs above:
- The EDIDs may exclude BT2020RGB from the Colorimetry Data Block and/or HDR and SMPTE ST2084 from the Electro optical transfer functions.
- If HDR is removed from Electro optical transfer functions, then Desired content max luminance is reduced from 1600 nits to 507.620 nits and Desired content min luminance is increased from value 1 to value 2 (both values are 0 nits).
- An alternative SDR mode may have max luminance and max frame-average luminance reduced from 507.620 nits to 161.049 nits while min luminance is increased from value 2 to value 4 (both values are 0 nits).
- Perhaps other presets (selectable in macOS via the Displays preferences panel or in Windows by the Boot Camp control panel) will make other changes to the EDIDs.

asus-pb287
- ASUS PB287Q Monitor - 28 inch 4K UHD (3840x2160), 1ms, Flicker free

asus-pq321
- ASUS PQ321
- 4K MST display.
- macOS doesn't support MST for multiple displays but does support MST for old 4K MST displays which use seperate streams for the left half and right half of the display.
- Left tile only. EDID for right tile of 4K MST display is not easily accessible in macOS.

asus-xg438q
- ASUS ROG Strix XG438Q

atlona-athd420-hdmi-override
- macOS override for the Atlona AT-HD420 HDMI to VGA/Component and Stereo Audio Format Converter

chiyakeji-r9a18
- 5K LCD controller driver board R9A18 LCD hd display motherboard HDR Freesync 4K 144Hz DIY For LCD LED screen LM270QQ2 LM270QQ1.
- Only EDID for tile 1 is included.

chiyakeji-r1811
- 5K universal DIY HD R1811 driver board USB-C HDR Freesync EDP VBO 144Hz DP1.4 LCD driver board for LM270QQ1 LM270QQ2.
- A 5K display, not tiled but I think you can get a tiled firmware.
- Maybe same board used in Geekon 27-inch 5K display.
- Other EDID may have display name "DP 5K3K".
- Supports DSC but I have not seen confirmation of 5K 60Hz 10bpc RGB.

dell-up2715k-dp1-optomedia-cmv535
- A Dell UP2715K connected to the DisplayPort output of a Optomedia CMV-535 HDMI 2.0 to DisplayPort 1.2 adapter.
- Example of "EDID 1.4 block does not set max dotclock.".

hisense-h9g-hdmi
- 65 inch Hisense H9G HDMI 2.0

kds-vs555
- KDS Visual Sensations VS-555 - CRT monitor - 15 inch

lg-31mu97-override
- macOS override for the LG 31MU97-B.
- Example of "DIRECT DRIVE monitor".

lg-34gn850b
- LG UltraGear 34GN850-B 34 inch 21:9 Curved UltraGear QHD 1ms Gaming Monitor with 144Hz

lg-34wk95uw
- LG 34WK95U-W 5K2K display.
- Thunderbolt 3 HBR2 tiled mode (dual 2560x2160).
- DisplayPort 1.4 HBR3 mode 5120x2160.

lg-34wk95uw-overlay
- In macOS, a supported dual-tile display usually has a .mtdd file containing an overlay which is an EDID that represents the display as a single tile.
- Example of "There are more Native DTDs \(\d+\) than DTDs \(\d+\)\.\n"

lg-55sj850v
- LG 55SJ850V

lg-c8
- LG C8 OLED TV

lg-ultrafine-5k-v1
- LG UltraFine 5K v1
- Has some minor differences from v2.

microsoft-surfacebook
- Microsoft Surface Book

optomedia-cmv535
- This converter has two dip switches to select between 4 EDIDs.
- Similar models:
-- Optomedia CMV-535 HDMI 2.0a to DisplayPort 1.2a Converter
-- SIIG HDMI 2.0 to DisplayPort 1.2 Converter - 4Kx2K 60Hz
-- gofanco Prophecy HDMI 2.0 to DisplayPort 1.2 Converter/Adapter

panasonic-tx65gxr900
- Panasonic TX-65GXR900

philips-ftv
- Philips FTV
- The HDMI 2.0 version comes from enabling UHD HDMI.
- Example of Dolby VSDB items "10 bit", "Standard + Low-Latency + Low-Latency-HDMI".

planar-ix2790
- Planar IX2790
- A single tile 5K display

samsung-lu28r55
- Samsung 28 inch UHD resolution monitor with IPS panel
- Example of "The year %d is more than one year in the future."

samsung-q800t
- Samsung 75 inch Q800T 2020 8K monitor has some HDMI 2.0 connectors and one HDMI 2.1 connector. The Game mode option enabled VRR.

sharp-lc70uq17u
- SHARP LC-70UQ17U has four HDMI inputs and a VGA input. Other inputs don’t have EDID.

sony-gdmf520
- Sony GDM-F520

sony-snyc901-override
sony-snyd301-override
- macOS overrides for some unknown Sony TVs.
- Examples of "Interlaced audio" and "Interlaced video".

sony-x900f
- Sony X900F

vizio-e65e0-hdmi
- Vizio E65-E0

vizio-m60c3-hdmi-onkyo-txnr555
- VIZIO M-Series 60" Class Ultra HD Full-Array LED Smart TV | M60-C3
- Connected to Onkyo TX-NR555 (receiver)

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 data/_EDID_ACR_0497                            | Bin 0 -> 256 bytes
 data/_EDID_AIC_1005                            | Bin 0 -> 256 bytes
 data/_EDID_APP_921f                            | Bin 0 -> 256 bytes
 data/_EDID_APP_9220                            | Bin 0 -> 256 bytes
 data/_EDID_BNQ_802e                            | Bin 0 -> 256 bytes
 data/_EDID_CMN_152a                            | Bin 0 -> 256 bytes
 data/_EDID_CVT_0003                            | Bin 0 -> 256 bytes
 data/_EDID_DEL_0001                            | Bin 0 -> 128 bytes
 data/_EDID_DEL_a07b                            | Bin 0 -> 384 bytes
 data/_EDID_DLM_0000                            | Bin 0 -> 256 bytes
 data/_EDID_DON_0046                            | Bin 0 -> 256 bytes
 data/_EDID_DVI_0000                            | Bin 0 -> 128 bytes
 data/_EDID_ELE_0938                            | Bin 0 -> 256 bytes
 data/_EDID_GDH_0030                            | Bin 0 -> 256 bytes
 data/_EDID_GSM_0001                            | Bin 0 -> 256 bytes
 data/_EDID_GSM_5b08                            | Bin 0 -> 256 bytes
 data/_EDID_GSM_5b08_2                          | Bin 0 -> 256 bytes
 data/_EDID_HPN_3530                            | Bin 0 -> 256 bytes
 data/_EDID_HPN_3645                            | Bin 0 -> 256 bytes
 data/_EDID_HSD_03e9                            | Bin 0 -> 128 bytes
 data/_EDID_HSD_04bb                            | Bin 0 -> 128 bytes
 data/_EDID_HWP_331b                            | Bin 0 -> 256 bytes
 data/_EDID_HYO_049b                            | Bin 0 -> 256 bytes
 data/_EDID_IVM_6615                            | Bin 0 -> 256 bytes
 data/_EDID_IVM_6640                            | Bin 0 -> 256 bytes
 data/_EDID_KMR_461a                            | Bin 0 -> 256 bytes
 data/_EDID_LEN_65cf                            | Bin 0 -> 256 bytes
 data/_EDID_LEN_65ed                            | Bin 0 -> 384 bytes
 data/_EDID_LEN_b800                            | Bin 0 -> 256 bytes
 data/_EDID_LGD_05c0                            | Bin 0 -> 128 bytes
 data/_EDID_LGD_4601                            | Bin 0 -> 128 bytes
 data/_EDID_LTM_2c02                            | Bin 0 -> 256 bytes
 data/_EDID_MSI_1462                            | Bin 0 -> 256 bytes
 data/_EDID_NOV_0405                            | Bin 0 -> 256 bytes
 data/_EDID_NSO_5605                            | Bin 0 -> 128 bytes
 data/_EDID_OEC_d501                            | Bin 0 -> 128 bytes
 data/_EDID_PDI_0030                            | Bin 0 -> 128 bytes
 data/_EDID_PHL_01ea                            | Bin 0 -> 256 bytes
 data/_EDID_PHL_01ea_2                          | Bin 0 -> 256 bytes
 data/_EDID_PHL_08fa                            | Bin 0 -> 512 bytes
 data/_EDID_PHL_c193                            | Bin 0 -> 256 bytes
 data/_EDID_PIO_0000                            | Bin 0 -> 256 bytes
 data/_EDID_PKB_00f8                            | Bin 0 -> 128 bytes
 data/_EDID_RHT_1234                            | Bin 0 -> 256 bytes
 data/_EDID_RJT_003a                            | Bin 0 -> 256 bytes
 data/_EDID_SAM_08f1                            | Bin 0 -> 256 bytes
 data/_EDID_SAM_0f14                            | Bin 0 -> 256 bytes
 data/_EDID_SAM_0f99                            | Bin 0 -> 512 bytes
 data/_EDID_SAM_7004                            | Bin 0 -> 256 bytes
 data/_EDID_SAN_2400                            | Bin 0 -> 128 bytes
 data/_EDID_SCN_03ff                            | Bin 0 -> 128 bytes
 data/_EDID_SEK_0000                            | Bin 0 -> 256 bytes
 data/_EDID_SHP_1008                            | Bin 0 -> 256 bytes
 data/_EDID_SPT_1801                            | Bin 0 -> 128 bytes
 data/_EDID_SUN_058f                            | Bin 0 -> 256 bytes
 data/_EDID_TCL_5655                            | Bin 0 -> 256 bytes
 data/_EDID_TGL_00f1                            | Bin 0 -> 256 bytes
 data/_EDID_UPD_4843                            | Bin 0 -> 256 bytes
 data/_EDID_USR_0100                            | Bin 0 -> 256 bytes
 data/_EDID_VIT_03dc                            | Bin 0 -> 128 bytes
 data/_EDID_VIZ_0030                            | Bin 0 -> 128 bytes
 data/_EDID_VIZ_0067                            | Bin 0 -> 256 bytes
 data/_EDID_VIZ_0092                            | Bin 0 -> 256 bytes
 data/_EDID_VIZ_1018                            | Bin 0 -> 256 bytes
 data/_EDID_VIZ_1018_2                          | Bin 0 -> 256 bytes
 data/_EDID_VSC_0e23                            | Bin 0 -> 256 bytes
 data/_EDID_VSC_0f1e                            | Bin 0 -> 256 bytes
 data/_EDID_VSC_2034                            | Bin 0 -> 256 bytes
 data/_EDID_VSC_bd2b                            | Bin 0 -> 384 bytes
 data/_EDID_XXX_001a                            | Bin 0 -> 256 bytes
 data/_EDID_YTH_0156                            | Bin 0 -> 256 bytes
 data/_EDID_YTH_1560                            | Bin 0 -> 256 bytes
 data/acer-xb321hk-dp                           | Bin 0 -> 256 bytes
 data/acer-xv273k-corrected_difdb               | Bin 0 -> 384 bytes
 data/{acer-xv273k-dp => acer-xv273k-dp1}       | Bin
 data/acer-xv273k-dp1-corrupted                 | Bin 0 -> 384 bytes
 data/acer-xv273k-dp2                           | Bin 0 -> 384 bytes
 data/acer-xv273k-dp2-corrupted                 | Bin 0 -> 384 bytes
 data/acer-xv273k-hdmi1                         | Bin 0 -> 256 bytes
 data/acer-xv273k-hdmi2                         | Bin 0 -> 256 bytes
 data/aoc-c24g1-dp                              | Bin 0 -> 256 bytes
 data/aoc-c24g1-hdmi                            | Bin 0 -> 256 bytes
 data/apple-17-inch-studio-display-crt-override | Bin 0 -> 128 bytes
 data/apple-applevision-750-override            | Bin 0 -> 128 bytes
 data/apple-applevision-850-override            | Bin 0 -> 128 bytes
 data/apple-cinemahd-23-2006-dvi                | Bin 0 -> 256 bytes
 data/apple-cinemahd-23-2008-dvi                | Bin 0 -> 256 bytes
 data/apple-imac-27-inch-mid-2010               | Bin 0 -> 128 bytes
 data/apple-imac-retina-5k-27-inch-2017-tile0   | Bin 0 -> 256 bytes
 data/apple-imac-retina-5k-27-inch-2017-tile1   | Bin 0 -> 256 bytes
 data/apple-macbookpro-16inch-2019              | Bin 0 -> 256 bytes
 data/apple-xdr-5k-tile0                        | Bin 0 -> 768 bytes
 data/apple-xdr-5k-tile1                        | Bin 0 -> 512 bytes
 data/apple-xdr-6k                              | Bin 0 -> 640 bytes
 data/apple-xdr-6k-tile0                        | Bin 0 -> 896 bytes
 data/apple-xdr-6k-tile1                        | Bin 0 -> 640 bytes
 data/asus-pb287                                | Bin 0 -> 256 bytes
 data/asus-pq321-dp-tile0                       | Bin 0 -> 384 bytes
 data/asus-xg438q-dp                            | Bin 0 -> 384 bytes
 data/atlona-athd420-hdmi-override              | Bin 0 -> 256 bytes
 data/chiyakeji-r1811-dp                        | Bin 0 -> 384 bytes
 data/chiyakeji-r9a18-dp-tile1                  | Bin 0 -> 384 bytes
 data/dell-up2715k-dp1-optomedia-cmv535         | Bin 0 -> 128 bytes
 data/hisense-h9g-hdmi                          | Bin 0 -> 256 bytes
 data/kds-vs555-vga                             | Bin 0 -> 128 bytes
 data/lg-31mu97-override                        | Bin 0 -> 384 bytes
 data/lg-34gn850b-dp                            | Bin 0 -> 384 bytes
 data/lg-34wk95uw-dp                            | Bin 0 -> 384 bytes
 data/lg-34wk95uw-overlay                       | Bin 0 -> 384 bytes
 data/lg-34wk95uw-thunderbolt-dp1-tile0         | Bin 0 -> 512 bytes
 data/lg-34wk95uw-thunderbolt-dp2-tile1         | Bin 0 -> 256 bytes
 data/lg-55sj850v-hdmi                          | Bin 0 -> 256 bytes
 data/lg-c8-hdmi                                | Bin 0 -> 256 bytes
 data/lg-ultrafine-5k-v1-thunderbolt-dp1-tile0  | Bin 0 -> 384 bytes
 data/lg-ultrafine-5k-v1-thunderbolt-dp2-tile1  | Bin 0 -> 256 bytes
 data/microsoft-surfacebook                     | Bin 0 -> 128 bytes
 data/optomedia-cmv535-hdmi_dip00-v2018         | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip00-v20180312     | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip00-v20180618     | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip01-v2018         | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip01-v20180312     | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip01-v20180618     | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip10-v2018         | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip10-v20180312     | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip11-v2018         | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip11-v20180312     | Bin 0 -> 256 bytes
 data/optomedia-cmv535-hdmi_dip11-v20180731     | Bin 0 -> 256 bytes
 data/panasonic-tx65gxr900-hdmi                 | Bin 0 -> 256 bytes
 data/philips-ftv-hdmi1.4                       | Bin 0 -> 256 bytes
 data/philips-ftv-hdmi2.0                       | Bin 0 -> 256 bytes
 data/planar-ix2790                             | Bin 0 -> 384 bytes
 data/realtek-r9a18-hdmi                        | Bin 0 -> 256 bytes
 data/samsung-lu28r55-hdmi                      | Bin 0 -> 256 bytes
 data/samsung-q800t-hdmi2.0                     | Bin 0 -> 256 bytes
 data/samsung-q800t-hdmi2.1                     | Bin 0 -> 256 bytes
 data/samsung-q800t-hdmi2.1-game                | Bin 0 -> 256 bytes
 data/sharp-lc70uq17u-hdmi1                     | Bin 0 -> 256 bytes
 data/sharp-lc70uq17u-hdmi2                     | Bin 0 -> 256 bytes
 data/sharp-lc70uq17u-hdmi3                     | Bin 0 -> 256 bytes
 data/sharp-lc70uq17u-hdmi4                     | Bin 0 -> 256 bytes
 data/sharp-lc70uq17u-vga                       | Bin 0 -> 128 bytes
 data/sony-gdmf520-vga                          | Bin 0 -> 128 bytes
 data/sony-snyc901-override                     | Bin 0 -> 256 bytes
 data/sony-snyd301-override                     | Bin 0 -> 256 bytes
 data/sony-x900f-hdmi                           | Bin 0 -> 256 bytes
 data/vizio-e65e0-hdmi                          | Bin 0 -> 256 bytes
 data/vizio-m60c3-hdmi-onkyo-txnr555            | Bin 0 -> 256 bytes
 147 files changed, 0 insertions(+), 0 deletions(-)
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

diff --git a/data/_EDID_ACR_0497 b/data/_EDID_ACR_0497
new file mode 100644
index 0000000000000000000000000000000000000000..619774a21ad0d98c720e91bd368dcfdbd1e772ef
GIT binary patch
literal 256
zcmZSh4+ab@MblXdJqsqQ$}%!H7)V!~vfQvVBw(JJU_i+J_YH;qjSh_sjRzVTrZQ}1
zxOjlcszIXALf0We$CcqOk01ks90LQxUj}m@`Cvf?E(I_Eiu_^lb~G|F@Cbwm0Y&~Z
zgqRw-x*8Z5T9_Idb1`}_F-vUpXJle#VP#{VASfg(A}S`I%*?}pX#=Ay&`udKg$Ny0
oh@JBoWf_VBFUTq6X@o*u(ZhA2OW}d8fPmdJh=>HxPJCcG0AOP}0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_AIC_1005 b/data/_EDID_AIC_1005
new file mode 100644
index 0000000000000000000000000000000000000000..f19a1dc82cd99d1105cbab34fda40b6e8442a49b
GIT binary patch
literal 256
zcmZSh4+adZ%B%u{R~Z=0Bp8_+Y?LarHnA=a^Pi`|9}u$tJ;TKVi9S;qrt)uQXl!5v
z0w${li9!oqhX@^4hOhud1_n6>28O>37Cv&pf(%>=U;q^P!{DPEZe$J>PymYjXD~GZ
zLYN4nI}@|qM{iaU0eKc-W+5g)MrBTR#%4wahE!%A1_6d1t_xiX4|D|t?508NkzkZ%
iC<?qFr;w)+3bh$i4Nzo)f`g#~j{{VV1kh&eKpX(h*);(G

literal 0
HcmV?d00001

diff --git a/data/_EDID_APP_921f b/data/_EDID_APP_921f
new file mode 100644
index 0000000000000000000000000000000000000000..34d578be0b2dc9a348c730d7e8c9370a76f15358
GIT binary patch
literal 256
zcmZSh4+acu0`imAa{pse=3``TFqE&*JHK^tsOL;ofq)PO28N3aj3_|WreQ(B24x2W
z1v7^CW`Yb1Qb0w27@RZnQgag(JX{o9GK;|?1v!b8TtF5M!1&97kqIPM#=y9g;s1YT
QDXA5VV6_fllIBD+0L!o<0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_APP_9220 b/data/_EDID_APP_9220
new file mode 100644
index 0000000000000000000000000000000000000000..548609281e889ff9fa79306247d457d623e35d49
GIT binary patch
literal 256
zcmZSh4+acu0t%D1GBGfz@iDS2b<n8LN_e_B+<T6yU_b~10|O%(*dxubAV5Lfz(B!_
zp>d)j1B29t42A^@9P|<pB0z0_7@RZnQgag(JX{pGfP9dMOJ;FFPGTj5%Q)SEkr^a@
bK!tHB!%_xDCT2;=6(9iy1_v-nV<Hy-%u6Ey

literal 0
HcmV?d00001

diff --git a/data/_EDID_BNQ_802e b/data/_EDID_BNQ_802e
new file mode 100644
index 0000000000000000000000000000000000000000..9f340cdf584ee5bbfa70503fdfc6493982054602
GIT binary patch
literal 256
zcmZSh4+adJ7xfw#fk0M{k!7omQiZ+7)a9Xmi`Do8LY8JXTs+Wtppl`mVda6%3@aTN
z8GSD>Ecj4h*I=Mv$`Bf$$iN`Qz`*dI!8Ihn+{eJs*w8T8#{ekumqEj(r^kkoO92dk
zB7Yd1Qu6{80$hyD4GcoL7%ww1>wOGMOo)w(7hq*!W@2aKmse0!5)l>>V^rp3XK!X;
zc+7f$;Tan%V^pvUlU0L6p@ptPgpMo3TDh<|h6M{2Xa*o0(v!jv@S#AyfkQ!p1@1JU
J%~-)J1_1dsJ^%m!

literal 0
HcmV?d00001

diff --git a/data/_EDID_CMN_152a b/data/_EDID_CMN_152a
new file mode 100644
index 0000000000000000000000000000000000000000..a85a2ddd268eb83a7e9e5bab24d3b8af8c882134
GIT binary patch
literal 256
zcmZSh4+adp>$F4}fIvWwk!7ipa0N5})OA758`Ss%LV%)-XdpS6VZnk0<pBl?Squ>e
z1sE74fQtU|7%XLCa%1FD00W@NKL%%CKPVR{1{U!%G&S?~b=7tEbL3KB+)yA~$-uzO
uC=wvZ*z%uqK7&4kJi~m}G6q%#PM~sXfDlsy%TOa@1IG|U3v~19CjbC;t|b8g

literal 0
HcmV?d00001

diff --git a/data/_EDID_CVT_0003 b/data/_EDID_CVT_0003
new file mode 100644
index 0000000000000000000000000000000000000000..958b9b49ea7c8d89890039c324b37c1f089331c0
GIT binary patch
literal 256
zcmZSh4+ac;SC|<<KtP0%xgo`tq3hk$#UVa3)%XKKmijR;q5&qW28luoU55xAR|b1$
zMFs{bpw_<(5~2J70t{RVU;q^P!{8hi;;Il51`z_8j|v!LnV7Xo{3o!oFtanUG0KYw
z3yBGeDs!?kH#0IY<S_Fv2rxA0DlA}PVC-R(W!MvRK~7<ZMySJ)KA@d)jIs?Eie$tT
r1awpzz#{W{xGr=lJkS*ou$#sp3{oQj6q%slV5q?35DFDRae)i~Ix{f=

literal 0
HcmV?d00001

diff --git a/data/_EDID_DEL_0001 b/data/_EDID_DEL_0001
new file mode 100644
index 0000000000000000000000000000000000000000..4ca9eb597fe1189f9efc62c5825fc9ede47b016a
GIT binary patch
literal 128
zcmZSh4+abZYZw`r7#J8B1sRzel%)T20ohQn_8fa-10xCm%KT?AKn7Sv{xVqj$Om&X
YAPoD%;Nt4zqu}Wh<mk+$puoTd0OVyD0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_DEL_a07b b/data/_EDID_DEL_a07b
new file mode 100644
index 0000000000000000000000000000000000000000..c922b8954253fc81c944dbd055356ec57d05f5ce
GIT binary patch
literal 384
zcmZSh4+abZYpNIccsUvviZZe+HBqRrdN*}(h|f$l{(z8$91M*PjSVXuHZxp2zz7B!
zHVq33HYht7D3~#@xhOI)NHH)l{AY+X^e_!EbP6_b^zz{Xiu_@4arN<02sJV>H1g$A
z0E+x&FtU{k7G&U300V}82B`f8>lk+E_k7*RFU`o@z{Xl3_iiH0exNpVkTJ(0V8a6Y
z01gES9vdT|tVB<yLkUPk0xkj+{lnlJ1hold9Z=*igH4otyA8~K#vM$|8ceCoJPZO1
r={I7JFa|a-l*S01Vq{NMJ-zO&Kt%4O8CH>OMNd?Tv=L|pNni^An;lsJ

literal 0
HcmV?d00001

diff --git a/data/_EDID_DLM_0000 b/data/_EDID_DLM_0000
new file mode 100644
index 0000000000000000000000000000000000000000..c4ebc04a6edc6cc61bb655d54ef2fd0bd7a3580b
GIT binary patch
literal 256
zcmZSh4+ac^y$lRD9nEC5I2l<O7#RLD0SPEjJi*}T(0HJ+VJgE)hs_KZ4_st0&|;Vo
z$e`t5P#_FZBnPDaF!<#w_~z$jmgE<4DJTF%{xgIIJH?wA8yV=P8=0Fylp>RiTLl=I
xm>GQ)!xjZH$QgKaSV3fEin%UqP<S9BAmIQLkrxn17ZH$F5qNk2*#rvNrU3VYC;<Qf

literal 0
HcmV?d00001

diff --git a/data/_EDID_DON_0046 b/data/_EDID_DON_0046
new file mode 100644
index 0000000000000000000000000000000000000000..f7e506192b5399f4209ef777bebf80631546bc07
GIT binary patch
literal 256
zcmZSh4+ac^@7x#|fq+4hk-1?(R0Y?&iHk#gW~%WAge>G>Fm!NrNOUN4XlwwfVPxcZ
z!C>&IAgW<QL>GfYOELq49FtXpM4^SQLxheiRD^+n;SYn0tDnE0u47mbmx6)<P~<Oz
zm7QFN4FiY^1dP^9%#|PG1m?2{vx+b?2`MNli83Z6#>T~`rX?k(@G0}F$f=p~*R$Ko
z9S~&?h_7P~XJbyUV~($5Y>sDOsAuM3P+{0%qi|p%BNH<Vqa&XUhk%3tn}C>rhCo^d
nL;8)_Ba9Ud%uo0k4oEy^V`qHKdVt}XpxXt84~#&^0D(FHC2c_g

literal 0
HcmV?d00001

diff --git a/data/_EDID_DVI_0000 b/data/_EDID_DVI_0000
new file mode 100644
index 0000000000000000000000000000000000000000..b48d7ea70316a9324c24316e5cb609e0b13e62a0
GIT binary patch
literal 128
zcmZSh4+acECmFziQJ9grK}WLU-TAGHLp^7z3Iv2K&2K35Z#>Y*(C9Fgq0nLF0Y=6e
zJqLlL76pTZ6~YX=ehM%!NTn$TYzSnKHgG5~gNgu+`^#YDBNrsdz@-2NK#@NTE@7Tr
IaKIo002w|c0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_ELE_0938 b/data/_EDID_ELE_0938
new file mode 100644
index 0000000000000000000000000000000000000000..7fde31eed1e30b84355769865c0eddf5131a44ca
GIT binary patch
literal 256
zcmZSh4+adPtrnb&3=9ln(u~Xvl`a)r=Svoc`)p9=^zc#SU}$t`Y*^{Q2nQ@B3<jSH
zq8c_tbTRDeRAgX~W3p<HD74UZh|qCmIMN3a0UGv)!PUpa+tD}5)YQ<NO93eImqFZ?
z-$jmrO92cRmoYJ$fA(i&W)~9@W>HX75@DS`K~9IWo?VnZAe@cy4}(B6&{cWNJPZm9
zJ6seP8W@?FSsw8v_HbS3Qh1;%AYeBQVx0s~WP*Z&p#qOXC{%<|mSIoO1v!Ns8letw
KCjs4n48#EkA3Fg6

literal 0
HcmV?d00001

diff --git a/data/_EDID_GDH_0030 b/data/_EDID_GDH_0030
new file mode 100644
index 0000000000000000000000000000000000000000..97e6ba6e3910dfe3fbe4eb95f8d8c12720204c4c
GIT binary patch
literal 256
zcmZSh4+ab}9R>`H3=9m6vW(0P#f}wR=Svoc`)p9=^zZ?RGBW;W{Qn<Ffq??Y3kHKv
z1yKzfBDxrk^eHkh$T3+pNEBM=Iz;HWLPdbu{xAgRCKi<_goJS^00B_sFN3w4e2)zS
zn6IF~_?C$|;!`wh3p1mTu!tD@1bGFe*!YCRq?FXOxMU_aK~ZJSdiG|Z!}6GU7>pQx
z*eEbGFfuW-q~C}=!dTJ3{)plJW7hkOkJ(rmAM(Fubi2Ud7H%}lLT+mh*M%;H2f6|R
PcGDp4kpS9`30?pIodQAu

literal 0
HcmV?d00001

diff --git a/data/_EDID_GSM_0001 b/data/_EDID_GSM_0001
new file mode 100644
index 0000000000000000000000000000000000000000..f153ad6392ddcf3d7ba60b0dbdeec94b75fa919d
GIT binary patch
literal 256
zcmZSh4+ac!xr_{qARx}j+^`_3g6rMH#UVa3)%XKK7IH8cI=DI{IutrIHh|SIGFdf9
z6k6yyMCiCOIJ6`)Fvz7T25bmqkT!5AFoTLPFfjaOu(Fd27GU5~00W@N9|j+Hg^)0)
zfCA$SCT8=G9ut%lSXr2v7<Ej=J#5(yh_VN8hO<{N^Dr1NG{`9&;A8Y>_{Sl@CLkf8
uAz&f!n3aJ6(*caKKqtwFDMaX~LL4xUQI?@7@PeE|o<=CbNkBIsgW~|2X*U4?

literal 0
HcmV?d00001

diff --git a/data/_EDID_GSM_5b08 b/data/_EDID_GSM_5b08
new file mode 100644
index 0000000000000000000000000000000000000000..26efc68e9e6c6469c63f82eba2be0bf2cc938479
GIT binary patch
literal 256
zcmZSh4+ac!xg603qD%~2GK|a(HcAz*3{01Y`Yl%D4+v4@U?_BGY-l{N^1#IdjSP%H
z!13Zp&ZB~;h7A#23=tuU3=C2%CFmjy3=Dr6ENtc4Z5X%|zyK)nhr!2PAvC9?C{e+~
zg-e0)2@|tIq5A|S1r}x|MrBTR_H<?*1_y>6Ht9EFk1$qzbYQY-kSMg!b%@Y$h1wJr
V$FN|*0?hye1yiU9&|GqX8vwCDIRO9w

literal 0
HcmV?d00001

diff --git a/data/_EDID_GSM_5b08_2 b/data/_EDID_GSM_5b08_2
new file mode 100644
index 0000000000000000000000000000000000000000..67ccd2698b6b9597324027c9ed017f6fcb13693a
GIT binary patch
literal 256
zcmZSh4+ac!xg60G=W{S{NHH=u*eF%JGB8~p>bF>pKOjVrgQ3u&v7zz6$^#b<G%_#(
z0ZR#k!KZ?#h7A#23=tuU3=DE%aSRI<EYJ)vP%wpvNHH)l{9*8MR|w51DN0oEaN$w_
ziu`4;u$60<W8hK%14dsaX2n9c2}-Oi%#6yM?CiPBJPZm9J8Tpf5*V47nXDQl3N3UU
zB6M6C1UP}(<rrlfE))Sp1aw>*;35)*GGYo5I;s#g^B83riUKdlDdcH{LUr|UUFcGH
RperC?Hw_{p0W=E?908UaI{^Ry

literal 0
HcmV?d00001

diff --git a/data/_EDID_HPN_3530 b/data/_EDID_HPN_3530
new file mode 100644
index 0000000000000000000000000000000000000000..c3af9bab176144ac21f4e31b0fca57db02a91807
GIT binary patch
literal 256
zcmZSh4+acMd<LeBKwv1t$lPF~RH3CYb$O`YVm1DNkcAu!7Y{TZXl$6uu=2o4hs_KZ
z8GJ7=Ecj4h*I?ja$`Bf$$iN`Qz`*dALBdA5-G+fn0Stg5e;7Oh6oQS+4f4QZK#~6p
zX3oAACYDCdE<r#s#zrP)^^M+%2?Fvg!puTUf{c$Cw9}b+7z7wBY|?MU9$~C#V0g^W
uzz`P4uwcOg%>V-hn1w7Q3<jSHq8c_tbU~aT_dXEhD9Hwd8lZ&)fDZt$Nj(7o

literal 0
HcmV?d00001

diff --git a/data/_EDID_HPN_3645 b/data/_EDID_HPN_3645
new file mode 100644
index 0000000000000000000000000000000000000000..ffaab68198c44a7477e9a19c386dcdae52cf0484
GIT binary patch
literal 256
zcmZSh4+acMe6D7UK%g$m$lPF~RH2vIx;nspl^S0_$Wm{Hiw9O7XgqL{VKc*2hDL^!
z4q<T&3l=QU3@}hIWe5#WWMGhDU|{&mU@$@Mz6}GH0vG^A{xJCay80<ZC>WW81c4&|
z8JzvREsZS=3`0zSLX7K~n4Ld*3CObuGYc^ZGTJM1va>fcGBBhw^Dqc7Sh%F$h&{qs
z(ZG-kw1A1*;KN(?Op8p5XKd_@nVI^JSsyn(V#r>2x1plIBEUgLVFnMxG4oz9R4iDK
X9>Ae6g9Rdze+cB@P*ev4-6I14Vx~p`

literal 0
HcmV?d00001

diff --git a/data/_EDID_HSD_03e9 b/data/_EDID_HSD_03e9
new file mode 100644
index 0000000000000000000000000000000000000000..8de2ea924568a66caf89bf7f2e5453e8c66a8594
GIT binary patch
literal 128
zcmZSh4+acMDKD8npJrgt6Jlg;5aX@jYEzpM9ymc=(LaQNfq@YXOc7+*;1D6HV5;oO
laHkQdKvGPE;f6zmnnJ9yC<|BwD9G>+M4$kK2qReh9RN|f836zQ

literal 0
HcmV?d00001

diff --git a/data/_EDID_HSD_04bb b/data/_EDID_HSD_04bb
new file mode 100644
index 0000000000000000000000000000000000000000..73d568ade34e9d7891ac9595aa2bf814ec158f6b
GIT binary patch
literal 128
zcmZSh4+acMDZ5z`7#J8hgczAKG^HxEKDaCi_L{3A;vc^MeM6#Kp?~9n#)b(F6a1$#
zOy!@Yx!^)zi;_XW3^Rrq{{<KrWPn=#Gguf{ctjXFMH(0wSegMv{xX;w8ygzI5K!a~
QgQJI`r6HFB1TbU+0HPu%0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_HWP_331b b/data/_EDID_HWP_331b
new file mode 100644
index 0000000000000000000000000000000000000000..9a6d7b889f8aa1dd4336e7cc32d7bc99514125ba
GIT binary patch
literal 256
zcmZSh4+acMAEb>L85kH;q#2nTjN~e`L=~2Y1<g_C4+vSv!Eo`wW`>mqrZO}(G%_?E
zU}R*nYLF<j&~=E=ab>u}BgnuY2h{qP!N^7~K#+k;0Stg5e;7Oh6pV~giy=Zlk^c<F
x&c5cxW(H2C5kOUpIZVvb8$Bn;vj{T_F)|4%bJnvrq%-p{0F6`vDyKP+0RYqRCIJ8d

literal 0
HcmV?d00001

diff --git a/data/_EDID_HYO_049b b/data/_EDID_HYO_049b
new file mode 100644
index 0000000000000000000000000000000000000000..2b3a1dbf828125d753b61a3476325ebec8c829dd
GIT binary patch
literal 256
zcmZSh4+ad%`m<RWfIvf(k$I_&QiW3f#^s?t^Hg~PLV%)-Xdo<(VZnk0ngIq1rVOD0
niVO@=Kt+ETTtXdvbX~$cxfFl^ECObMcp!i&!YBx_e&9#|5>c6f

literal 0
HcmV?d00001

diff --git a/data/_EDID_IVM_6615 b/data/_EDID_IVM_6615
new file mode 100644
index 0000000000000000000000000000000000000000..15615f7996d96d9c4fc796a2606a445c63175539
GIT binary patch
literal 256
zcmZSh4+acsXGPN(f#AP5Bg;}7r3$MPtjj~a7pU<BgzSIc(AY4QVda694x1S+9=OQx
z@IY7`!-541Gy@D2Oc_E06d4$#7#JA-GZ=6wAOKM0FN3*{T$CgekO>8U7y^8Z%*`zW
zAu1UkGcjv^2oR8G6=4x(W)c!)XA=`uVASMfXXjvG0HS6_28Ps~A`C1HOjZpNg%-LF
z5jw6AE9HP97m9!)0y?e@U`NO?$}$uMUXWAB(+GvC>EXK2rSL#kK)`MqL_`AS5(s?<
E00p`{0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_IVM_6640 b/data/_EDID_IVM_6640
new file mode 100644
index 0000000000000000000000000000000000000000..a1c22d3db9520468a67d2e1813dcdc59fb77461a
GIT binary patch
literal 256
zcmZSh4+acsXC2ZQfk0S>k-5P}u|n(m*R_Gp8`XFNLiWFJczEC<!^H!e8CE*1JkZ$C
z$iVS}!QfLtRKtddE{0%#MFs{r1_p-z42FiLrbZTqmIelfh9*FfzYO9&{9QH-Tnb<S
z6#2st;A3QNZW$N|7Gun0Vs`luEFjM!%q+wt$ST4v#wN;`7#|m_%vsOg%*eoy%gn<d
zz+h3Kz>vVm#GHO3_6TFe0p>>x51;TeG_XJA1F6My4NFObL?O_95jrsU9o@sQV1Yx>
R1_K2vh>N9wu3=zc2LPdzNdW)=

literal 0
HcmV?d00001

diff --git a/data/_EDID_KMR_461a b/data/_EDID_KMR_461a
new file mode 100644
index 0000000000000000000000000000000000000000..d94efb9b31abf4b4332261556605dd67816f03e7
GIT binary patch
literal 256
zcmZSh4+adno21+r85kJY#28r)smS)cnxil$#J^unF(^#`JVRr{W`>mqCOE8gXmn^~
zDD-EtYLF<j&~=E=ab-|Y0BVz)r@$~FP(j|nqrr?pfD0%hrD!?9AW2HyA!CCXR1Hw{
z4?|dhu8El;mjW0tu47_W`s_PFo<*2dgh`N1R7p`mnUjUR8R(RBW*!Cs1`FL;nhP!j
zwkR0{%n*Q@lcpH9Dv&|Wz^&gHDxzW2u%KXrvV(yF%q|;Ch6N24Qa}+asG3ds5Rm}5
I2+%#703vZa0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_LEN_65cf b/data/_EDID_LEN_65cf
new file mode 100644
index 0000000000000000000000000000000000000000..28d497b74e2a1627a01aa972edc9638255e95f0f
GIT binary patch
literal 256
zcmZSh4+abd>&~Y#0)e<RBg;}#xeBZQS62qRE>PtS2-$z0;o^ad44WBN9+=9|*wA>O
z&_67WVZnk0ngIq1rVRWViVO@=3=9na8A44049qMe{J0c=04Va8LEMKwN|FK02aEh+
z@G&we)HO7K2r(KlG0T1M7GPyzW|9{X77}Ds=45AYW@KPUb$`IX!oXzJAW>+c>ky&i
z3b99?Q5Gm7Bc>3cqY4q3&nU}K6nH^SAx|R|A|ltrb)ie)fv$jn-86`Z1kjudML=@|
QbX*(2?v(?&4g}@_0BZp~0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_LEN_65ed b/data/_EDID_LEN_65ed
new file mode 100644
index 0000000000000000000000000000000000000000..77f2063aba080ffee05fd39be8677a8414b4a05e
GIT binary patch
literal 384
zcmZSh4+abd>)xh<S+a~QTWypotY2MR9pJH2l{X+nk%NH|4TQxpELgBWGr&N>lp!=g
zk%2*qfq~&agR*0=Z(g{oeyVA*c?wYEF9YL;|NpZXxfH+vDDsEF$JI|E(#Sl$P}j(m
zi)kSfv%*JZPIks-Mh1pdZx*0Uk68~eJYvXt#>UE+8l{$h2xL<zl1)(yKq78PBAjnP
zBI!sXK%0mI7Yc+cnHl&QxR!|U@v$>1xH2#>G4dMj%?ju!Ss81@%jg=y%&5T>$jI`a
hb3TK9gFM50)`<*E3@i+%<{*o00*eu6Cz2|W2>>FoPXPb`

literal 0
HcmV?d00001

diff --git a/data/_EDID_LEN_b800 b/data/_EDID_LEN_b800
new file mode 100644
index 0000000000000000000000000000000000000000..e5d772cf890f52858f7abcb12f101b978c400c4b
GIT binary patch
literal 256
zcmZSh4+abd>lk))w2JNImu6&cU}LS2dpB`$h|f$l{(uk$Opr0hAz;G-`v49F2_73G
zpu9v+rb7uxL;@}X6#c{C8^omm2SAa(3^q~n?KTWhQAS%PW(}rPW*!CshV&b;M;HSe
l7)oP=PBF48_UnH8q8u*0vTx^sy)%1Qh_n&YsrW^X0st{lH30ws

literal 0
HcmV?d00001

diff --git a/data/_EDID_LGD_05c0 b/data/_EDID_LGD_05c0
new file mode 100644
index 0000000000000000000000000000000000000000..1dae4ac301753a3a87233042fb8059d3eb67d975
GIT binary patch
literal 128
zcmZSh4+abdPY$p$fPge3%Tj-aidPR>7l-)GR^tl@0SYprfw=aD1qBwq4h9OQ3=xL}
efVwg)&_%$ep%Y9DJO-cmZKml78O#I8tpEVW+8hA@

literal 0
HcmV?d00001

diff --git a/data/_EDID_LGD_4601 b/data/_EDID_LGD_4601
new file mode 100644
index 0000000000000000000000000000000000000000..1731fa93cb410087f1e460157cc54874ba939e32
GIT binary patch
literal 128
zcmZSh4+abdPZ-@8KtPC5c!I1@1(#gww5ZS?HTi%Lpdcd}_#(y76rdnrV4z^eAh%h7
yfkC20h+#p1f;f^0P}@I-@K8&0;|4=x<M0S0F0cp(pNOP!Z2f;mMlJ;fhC=|pqZ|PM

literal 0
HcmV?d00001

diff --git a/data/_EDID_LTM_2c02 b/data/_EDID_LTM_2c02
new file mode 100644
index 0000000000000000000000000000000000000000..6b4c06f74ac9d82c7d1e7e0bf244329dd29bd5d1
GIT binary patch
literal 256
zcmZSh4+acIy-YfcARx-f+z@G0!Nq%WLAd)2bs-NQ1qKGN3=+X))gV!5q3aN#<I1og
zih+Saj!~AODDZ-uLY_t_L)j-opa@X(FN2YdoDnAjmjW07MgB1O`1^%;hWbK;7<rhO
z6%Tk$kY{BP7GY*$ROV!7Y-VI&NN46@`2U|l?hyk&qb$%W88L+j9aV-SeTobW^MJ-s
H4b%YuU+5+Q

literal 0
HcmV?d00001

diff --git a/data/_EDID_MSI_1462 b/data/_EDID_MSI_1462
new file mode 100644
index 0000000000000000000000000000000000000000..41e2a8550cd5f980f09334ffd481e6c4f5a00b58
GIT binary patch
literal 256
zcmZSh4+aconMopy3=9lXvWzTCP2?)9??f*S@tLW{@9w$&JVRqcVol?osSHzXHZyFt
zx%h|4szIXALf0We$CZIoRgr-~4yg4HgMUFuW`%;gk%=>xf&x(FFN48^MT^)OfjkfZ
ziu`9VKmvx0-<X)W4k~l9vp2W3<u@!SuyAlNP%wp>`Kzv>qrgJQK>{uUG=aJx3jl<0
BF#!Mo

literal 0
HcmV?d00001

diff --git a/data/_EDID_NOV_0405 b/data/_EDID_NOV_0405
new file mode 100644
index 0000000000000000000000000000000000000000..3bff6da7ac767ee85a022614905b2f589f4f0f51
GIT binary patch
literal 256
zcmZSh4+adD-&k3M+4vX)#2J|z<;1tVI{0*PxZfOQ*?<s54hBXv5N+15puj@e!9c-`
z;k1Sz1A`m`1H*p?KmRbt;1I_kUt=H_2>yUY6g*rMoE?K)Kq7w`460>L2r_UffC1ws
zCT3el-zHWT76CyKVR<%DW+6NNdPZ@13wd^+asiMYRM70tz>v<&1C-jK%P7lG#Bf25
yAy0#Wq0tklPVO3K!vcl}x(osdK#>Fn4i1SPt_u?w91IzF9Ka$B3=+uZ=>q_3&oBW1

literal 0
HcmV?d00001

diff --git a/data/_EDID_NSO_5605 b/data/_EDID_NSO_5605
new file mode 100644
index 0000000000000000000000000000000000000000..25abf431714025d8555e0f4dd575fb067e6c2e4c
GIT binary patch
literal 128
zcmZSh4+acY`K)1#K%l_K$iyKh&hUcObWxc1TvdsHkoD&nKr+aHfq~%{iXazI<S&Df
jx122p1D66A07d>Y7#LWX7(fLSfFgewd|XV85h7&(?BN#y

literal 0
HcmV?d00001

diff --git a/data/_EDID_OEC_d501 b/data/_EDID_OEC_d501
new file mode 100644
index 0000000000000000000000000000000000000000..7df3f9a36f0dac806382aeeae2f91f94fb1e7efb
GIT binary patch
literal 128
zcmZSh4+ac2iy5yn0D%!VBcqO-c*TpWZx=*)%}^2Z4PO6_fe{U)NHRD$GN>6ybeJ(1
zJP}}EkN|4^!(eEtq!8j3qTu7~!leKfQSi;r%Ph$+;!*$tpvYeaBX2ny4km*zBLz1f
HZ-#FG8jc_V

literal 0
HcmV?d00001

diff --git a/data/_EDID_PDI_0030 b/data/_EDID_PDI_0030
new file mode 100644
index 0000000000000000000000000000000000000000..141de06475d0cb0d3096cdde00a23c55bfcc6f89
GIT binary patch
literal 128
zcmZSh4+ablodyhy3=9mcVvH<}#<CS$m$ojB2%e+L9}uF*!N7<Hn5-Hk3N3UUB6M6C
z{>lk5FvtP5{$((-lZz4wWjNBO2oVurSfCkTpkT@n8UPfL0;>7L5aOom66VRJ00s=U
E0PHmz0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_PHL_01ea b/data/_EDID_PHL_01ea
new file mode 100644
index 0000000000000000000000000000000000000000..0c5f3f62218b62df85a20edf9961d80ca76214b1
GIT binary patch
literal 256
zcmZSh4+ad5Jg*o*Ku?B|xnV+J1y?ffve4jZs=V%AiX04^8KyF<beQ1K$k5o(=)lOx
zWYr*1Xrb#6q2tQ1Kr5JmK@KQ#p$I4<pyS#A5n*6p_`?v8k(rZOP^{n<62_$f6#2_w
zV8`!f!@#8g28;zv%(WlG6BFX&Vg=+CloUl+goOl|#Mnhynb{akIoa7o*#m6Z4}`Nb
zR<I?+vNNQ!FgG(YFyu4yFbFVM*euZ0WJq9SV$Qe`dxWu~ftl$MgXbfD=EtlD7#_3n
oGCpHxVPRlldCJ(`GJ)|mquT`rm-*g{ELAr@69lpgfbQuB05r5h0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_PHL_01ea_2 b/data/_EDID_PHL_01ea_2
new file mode 100644
index 0000000000000000000000000000000000000000..4c1671b0797c32937c3be3247aebfdee8cc940a5
GIT binary patch
literal 256
zcmZSh4+ad5Jg*o*Kv0g6xnV+J1y?ffve4jZs=V%AiX04^8KyF<beQ1K$k5o(=)lOx
zWYr*1Xrb#6q2tQ1Kr5JmK@KQ#p$I4<pyS#A5n*6p_`?v8k(rZOP^{n<62_$f6#2_w
zV8`!f!@#8g28`WI%n2Vu<Ktol<Q0?@MOcJ|1ewIxMOm5I7)?3Z*+tm{Y}pTlvolt(
zMa0)Jrn4|NGcqvbGxIPAFj&|u(9~o|U}R!`#Nhdu^#H?THeSZ3jNL607@rBcU0^6+
Oc+8iO2(%L)r~?3xC^-QD

literal 0
HcmV?d00001

diff --git a/data/_EDID_PHL_08fa b/data/_EDID_PHL_08fa
new file mode 100644
index 0000000000000000000000000000000000000000..e8439abe935c17229d5275edf03fb39bd53d2419
GIT binary patch
literal 512
zcmZSh4+ad5Jij=sbr={}WEfet#+y}GMc6J44W6UQ<L<TpJ;TKVn;E7uG&VFkG#+3C
z0^bV^3qBOsH5e$EGVGK$VqlO8i(^=@V1Z@;Tttq6f#ENMc!1mj8%8b#FaV1DVF>W>
zQE+ncH8D0d;8I{TU}9GL=*`H?D#9WxFT^A`L79`Cy_u1LA(xqlL4iS{LV+QHk%^g6
zmZ2!{f}BF0MkvHSxgM?yT?!9$1qAG-K|~~gA`=uG3>A1BplT$1a~c*DfL&<?btTXR
zs34XB>VKt6jH^IW|D_n28yFZWm=gA^3U%0~%;OUT6b1Pi8L*TTWHoHyaMTbv#8Tw~
zR3L#V0u=qj;1S}i8|E423Jw9F$X^DL3daAkun=Lq$HXk^;KaxT^fn{N+o?cr3osxX
QcAx^?c;ZEXIthS{0Du8>0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_PHL_c193 b/data/_EDID_PHL_c193
new file mode 100644
index 0000000000000000000000000000000000000000..cc054a4f3d119d011dce56a2adf0f9e875de0bb5
GIT binary patch
literal 256
zcmZSh4+ad5Jd+PzU}0e3mStqw>ZV>{9m%@h-)X%%UqHzI_Y4;gY-X6s(Ad!E(0G6m
z2z)OvEcj4h*I=Mv%CM_Xk%2)fERJEpf(4oZ2oVMbhCd7e9zF`jMrOWdVO$CdK#{);
z8a4|S*f0WlAi!9|#H{zxmywxOghg0hh)HllLZUJ!J9{%D149Ng4}$=MM1{g**2j#`
z*w`7%62zIT8YBuWbR8meTp{+#`Q|h%C;+>}3hI(AX&|@BH*hFOut3}fv=<k61^}m{
BK>+{&

literal 0
HcmV?d00001

diff --git a/data/_EDID_PIO_0000 b/data/_EDID_PIO_0000
new file mode 100644
index 0000000000000000000000000000000000000000..b79762b5007357f100e026dd801bfa49fc8712ba
GIT binary patch
literal 256
zcmZSh4+ad5`V0(=K)@ix$lQ=+UBUHk;^GjWnQHt2A$#996#6$FXk=(?n98v7z-FL2
zCaVUCLJM7o2pw03@-K!A404RJ4Ht@J#1sT{R2#q|^B5Qy{xV2-^9PDEa4CQRP~;Co
zSa5`{fpJKL2S||d2NSc$$KVO_EW)fJ%t8u^O6+3%DspPvQr4XH?ELlYqU-^7atC~w
z7{b{Y;_DdG>ln)AnVbC?7;>0-7=#&i=rUa3V03uIzz?)vq7Z0*gpMl2Me`VC8TJHS
SkW<*95$XVOBhY?y5CZ@=$vy!9

literal 0
HcmV?d00001

diff --git a/data/_EDID_PKB_00f8 b/data/_EDID_PKB_00f8
new file mode 100644
index 0000000000000000000000000000000000000000..17f3aea9b4c83c49ba586b03f3026389b29bfa4f
GIT binary patch
literal 128
zcmZSh4+ad5Nk14i1t?6>5@uxP(2=ardpC7)h|f$l{(zAE?;2JfDD-bU(8$0D1%`SK
z3`s3Y1`#Vv8Fv2^U|?WjU|{&mVD2p!Ai%(-00uyjKMY}+#i{v51_mJ@L7>Qg1{WhE
Q11AFmLvvF@0|kbq03b#s0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_RHT_1234 b/data/_EDID_RHT_1234
new file mode 100644
index 0000000000000000000000000000000000000000..87f99444ea81b6281542ce3b2223febb69bfb6e8
GIT binary patch
literal 256
zcmZSh4+adLA|^r%K%gbT$g)&QxPtB7#Kj>#Gu8M5LKHa|9v--OfDs9(DlnuuGDsOP
z$Qe6K))Qo4kN|4^%V1P1x1fTNO92dkB7YbHU426peDm`%OY)1jfFj=+xEQ<^sc0$y
Y*+9T(#Kg?S;98rS5GfB4p)>gj0LG0W0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_RJT_003a b/data/_EDID_RJT_003a
new file mode 100644
index 0000000000000000000000000000000000000000..c47d29e8e4440ad6d9a7c85748b6ff2caabbc1fc
GIT binary patch
literal 256
zcmZSh4+adLAyy0)6L=Y9WEq(o8ayg?)d<dubf2v*5D>EVJVRqc<AFqniw7DR7$HEG
zp(yZzoI;*XC<DWVAO;4RG{vx0fedm6ZvDm#VGO|x3~~$%41XC6efUEK8MqX{04VZD
z!NbMZ6UtXmV7$S^tn?wkl0BfAQJ#@eRtRFMG9v>+1~U(X0K*Pl1xA=%8c@6BfFgT>
zfVS_@2z3D4E_ao)VS&N}T>*{+C5DCviX0pgOjZpNg%-LF5jw664HhL3_W&J$1}*^r
DQd>O%

literal 0
HcmV?d00001

diff --git a/data/_EDID_SAM_08f1 b/data/_EDID_SAM_08f1
new file mode 100644
index 0000000000000000000000000000000000000000..a62c77b5ca853a0cfbdac4651c44040f2490771f
GIT binary patch
literal 256
zcmZSh4+acAx*s_VEe(y>#Tc0z45TZxCLLT989Gm$FCawMzkv}AFj+N76k6yyMCiCO
z+~pBuV31>AVED^m;Vl;^$iSrl20)QN48cZ5PR6DN5Fwz*e+Ca9KW8HY0}EqgpdjN4
QCZ;|I2ZaQn)PR6I0OPnH0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_SAM_0f14 b/data/_EDID_SAM_0f14
new file mode 100644
index 0000000000000000000000000000000000000000..f523f09f13a0b25f2b6dd357dc426da07dde40c3
GIT binary patch
literal 256
zcmZSh4+acAx+44xd<=|?GK|a(kwz6<%4?T|_|8=0clX-+zM;^+@jxR(W5ZO2l?OHh
z6>+>^F!)pu)vzI=iy=U^gn>bh$*Mu3&_dTCLdO*<!oa}rmqEgtzuks`O92dkB7Ycy
z9esmC{oEl!jO9$sVIRU11>{+TSw$2Sm15)K6H?QXl2h2ln1wVs+1W+e1H#!En;97x
X9x?boW<AW9$IQbZz_1_UY|2RhR%UqC

literal 0
HcmV?d00001

diff --git a/data/_EDID_SAM_0f99 b/data/_EDID_SAM_0f99
new file mode 100644
index 0000000000000000000000000000000000000000..d763840314c977692f3600ed2579016223381d1a
GIT binary patch
literal 512
zcmZSh4+acAx-<C=fIwY>k-4E<sX}Yf!nOWx%T@RSLiWFJDD-b+Xgtu^u=2oWhN%n}
z4@hM&Ecjp{?_i){#jrBKk%2*qfq~&KgG7bg0viS{1uy`L{9$l5u?%vztbhmsMgB8*
z7&>~Jf^0GX3NpKVU@8C#4;Yxo#BBS~XF_6vJd3apb5v|xyfP;{dov>g!(-M147toa
z3<3;0Y!nz07@3&UZ^Ry9tY~0<#>UFnT`cs7pDiqoVZnk0ngIq1rqE!B@MYMs&_cxF
zhmI>mL=L~#>I;M_85o!uHH^12bo>{d&!FER&oG}=gMo>GlOZIEfde5X0v5w>9I3LM
F69521P5}S_

literal 0
HcmV?d00001

diff --git a/data/_EDID_SAM_7004 b/data/_EDID_SAM_7004
new file mode 100644
index 0000000000000000000000000000000000000000..357c3ccf6af0c9a5dbd87b7196b844843261085d
GIT binary patch
literal 256
zcmZSh4+acAx-10@d<=|?a*WIkl`a)rD~wkMxGq)a_3+sHzM;^+@jxR(W5ZO2l?OI6
zTs*+>g2CWZK~%$rh%SZz*%Af@xv)5f1q&8v1{f%qLPVq(7#RLCNL29uFK6IV00W@N
zABJE@-{4R`cZd+<3?}B}4>5@eX{n`Uw{8o_vk0?_C@3n$#>FS4u!}JZ**oZPva^e_
z2ZXaTq=zsxGcqtdV(@>=dYCbfnTNrFVTO$cLjxldGfVD`*dvS;4UtR?3<r%_AG7f?
bKH~rXl(D;I0%QImkkdj@od$FZ2yg=c+M-DT

literal 0
HcmV?d00001

diff --git a/data/_EDID_SAN_2400 b/data/_EDID_SAN_2400
new file mode 100644
index 0000000000000000000000000000000000000000..ed6f364b5932c63a1b138e9f96a6b7be3f94c001
GIT binary patch
literal 128
zcmZSh4+acAdJHNTFD_))7hz;>FjcP5GHqNI<}ph}C?G_cgQ1b3(V?+nD#J>L%?yk{
zz+}}RQD~v-5TWDBaF<7rfgxUB&0#@8i<E(Zf+@r9p8^aFG7Jn1e;F*i<>G}HxD>zu
XDDsEF$Js@}*Wb@G#6O5jfguh6O0y#Y

literal 0
HcmV?d00001

diff --git a/data/_EDID_SCN_03ff b/data/_EDID_SCN_03ff
new file mode 100644
index 0000000000000000000000000000000000000000..675be4badbf5bdcf8b46505bed888e683060ee2e
GIT binary patch
literal 128
zcmZSh4+acAdH<O;85tPV`5Bq3)Z{Ak-b5~q@S3Hj7!<buJp&^e*ki&lBalJML12O~
xL#~P-1A`m`1H)ei4IjBcJ_arYFaV1DXMixFBv9lJgS(Hep{0?56Id049{{An9033T

literal 0
HcmV?d00001

diff --git a/data/_EDID_SEK_0000 b/data/_EDID_SEK_0000
new file mode 100644
index 0000000000000000000000000000000000000000..004769c067f81519f5de9b520c97e3ba5505b8b7
GIT binary patch
literal 256
zcmZSh4+acAs~H#=85kIp#Tl6!!wf3Ami8?R@tUJ1<m$He97Cf6BMM+CVKDeq5Y@0D
zqKhHyp&<i<+$_xn7Xn+93<74DF(iOQWPpbKWiaxVu;FIlQUC*>$RCDaS7Xc2NCOkF
z7-K3EvsR%$8#@!T=rlngVHOcq`3VZjob2q)K*!`V^DrndaM&m~WH2%@_i$a9px|Jr
zz~c}Ku~ULkwn3s$Mob|>M-?J64=8e>2q+?;quKy=7f^&@PtXN9g&i894iJ|DU4Z}{
E0K>#P0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_SHP_1008 b/data/_EDID_SHP_1008
new file mode 100644
index 0000000000000000000000000000000000000000..c0a060185b3028f2ba49929b4d4134c8d2c4b0b0
GIT binary patch
literal 256
zcmZSh4+adr0vrMiK=5CXk+~sAuR=?D-=a{H&1xcEK|oPPbRf&HC+LEl!VZm42a_{~
z3=DFNvJ6FmK#@F+PzHzyP}?7dU=PQj00j>hUr#Ot1)#`Z218qZJq`vS4+I#eF)^za
z`A%*TVHIK)WD;W+Wn)z4WM^+?WMIf*=3!7^Xy9)UWn`3XxKJb`rXZlB+5k3u9#BN0
S5GWF%qYANZ9?)<yfH?q%&?^A|

literal 0
HcmV?d00001

diff --git a/data/_EDID_SPT_1801 b/data/_EDID_SPT_1801
new file mode 100644
index 0000000000000000000000000000000000000000..61bfc673a2e322b410d7f9a96e3a165f404e319d
GIT binary patch
literal 128
zcmZSh4+ac=B8(D@Kp-W|$ef`mUZG{%x-86VmWoh7$o_W>h5m+IAXyklQw-P;$RKUt
zP+-O|>zM!pgFOQS!+!=#BQq~ULoY{110!>DpvYeaBX7ANJ_arYFaV1DVTdraG!57F
MOH5A$iZUnx0F5{v0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_SUN_058f b/data/_EDID_SUN_058f
new file mode 100644
index 0000000000000000000000000000000000000000..4e252d2a96df8c7500fee67ee7ed1a5dd01259e7
GIT binary patch
literal 256
zcmZSh4+ac=>-t#(oO2o31Q?kcj1{J7y`Q=`#Amh|e?Z9o_YD^rE*@xXXq>Rpp|Fh+
z2n4JfItn%@IdC|rFtE8OGBC)UG6jlQC?JU#XfezPWYBUjC=iCIkyvN!upwcCI#5j%
zR2SnT2S%m?0!*9?Dw0bX{{LrWVwRR(!IQ8-mP5gbk+Fe+fddRKFc1xL!771nWMXDv
oW#{DK7ZR0}RZ`bAv3BzGk4VZcscG$>yL{8`Ll<wq{P;r(0AI>I0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_TCL_5655 b/data/_EDID_TCL_5655
new file mode 100644
index 0000000000000000000000000000000000000000..10c1a4e49c38124c14f24ad0b41aa74a4b8a9ee5
GIT binary patch
literal 256
zcmZSh4+abYIiX>K0*nkIl8np^l`a)ryeAigyU$P;^6*jQU~qLvbZB%~>Co8Fc%b{h
z$^%SR4HAVGx(*RKt_%u?3>g^Y(iFp11v1DPxak-(>|Egl6k%Xs_`?w5?4uCu>lhTG
z5E8}(6#2_w<SiGV%)q4p28^vt%#NReCd_9QQD6}k5@co)6J=*(R8-RBWM>x@4+s}$
zd@sbp#K_Ie2*Ugf3<AxJ3=EGLxHFh}7z7x0xG*9+1!6IyEJIP?1v!O0jZlPBfOca8
F_W))`H~|0v

literal 0
HcmV?d00001

diff --git a/data/_EDID_TGL_00f1 b/data/_EDID_TGL_00f1
new file mode 100644
index 0000000000000000000000000000000000000000..4064d14d37bd878b911f13d0dd2b9dacc78c57c1
GIT binary patch
literal 256
zcmZSh4+abYZ$2_GGB7Ymi88V*GL@_NUNLD|u**zUnSfYD4hBXbXgmNSAz+>Y!-PNu
zc>|9IGoT(IkW;jrV2~uG?vSy;jDb^Ck%2*i$*Mu3&_dTCLdO-NMgmCvVQ>jka4|A5
zbo1d-P*7kz%EYYv(XX+oxuvzOeZs^^lc!9brp#H--dxYXkj~7*AiyASuZQcx1O*2}
z1s;b`h7dkMpwW!7K%-^E6e4s~AtLj7xE6>6eh_0&t8s>i%mC`@Qh1;%AYeBQstc$_
RAy7d=K%!0=D#E~!1prB{J^=s#

literal 0
HcmV?d00001

diff --git a/data/_EDID_UPD_4843 b/data/_EDID_UPD_4843
new file mode 100644
index 0000000000000000000000000000000000000000..fa4d430c45b98f95293a9558072ae759076c104c
GIT binary patch
literal 256
zcmZSh4+acjEY2Q`3=9k+VvNiUZt4}U8EP29JsDI5J-pwaZ&-PtF|x5CG14{CFw#)c
z@FtU0gG8Z)u0w>5D}%6>A_Ie557&h*g$KF<0(R3Fj`RUVB!GtfWsr=Lj22+vQUC*>
z$R7qDXBP_tL#PmACKI#fM_+bkF(DRVR*?zvib@K~ob~L=EcHCfto1z2j0^&4%sdPN
b3=NnTFv<cQAtR;`p`!}1avsnE62U?MZ5cEH

literal 0
HcmV?d00001

diff --git a/data/_EDID_USR_0100 b/data/_EDID_USR_0100
new file mode 100644
index 0000000000000000000000000000000000000000..983cc4e8b22094428bc3d99f236ed1c8d08cd56b
GIT binary patch
literal 256
zcmZSh4+ad^iWnFf85kHiWEhzn7#J$JmdMSG51Otb?31+jeM94cMux_QsSGO}E*?m%
zX|!RoYLF<j&~=E=ab*aQEn#4gW0Ykm3cMhvkf#yKaHLNWC;~L>FM~t`f0`g81D65_
z07d>V7&&_=7#dg@fccCYn3#>fcniq02(yYPC@L`v>2TJwOV$S{)(2?T2Q&j+l*P=$
zAi`jw%fP|#h~fWZRt5%QEN7GjI#5PTAwowL;+%OsTo<|&9_R`P*iB;)202gy=p2Tn
E0Eaq20RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_VIT_03dc b/data/_EDID_VIT_03dc
new file mode 100644
index 0000000000000000000000000000000000000000..48dca8b008fdadd53e5a116c2f19c820390342ec
GIT binary patch
literal 128
zcmZSh4+ad8CU=+_85kH0_!*fQl%)T^;?G+U?lDVEz}<hTKSN^!PzniHX)(+QWYBUj
sC=h0-&=q80kONBoVF(Mcw6Ne(fB=Z{)V$Q<%wmWbP~<0)As}W209V}_0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_VIZ_0030 b/data/_EDID_VIZ_0030
new file mode 100644
index 0000000000000000000000000000000000000000..1ee1210c36473974ce71903b24c7b9fc54710b91
GIT binary patch
literal 128
zcmZSh4+ad8Rt5}=K%g$j$ZQ{LQt_%adr^evTvdK|uccmK8IUXtq$!4N2xO2pXlPPn
zSj26_z#zrI!0?yBC{*5!n~7o11VxC*e}-U3M_(roV@o3=10xflnm-I-5hg}H3LY*Y
KVTJ~d41xf3wH^Tg

literal 0
HcmV?d00001

diff --git a/data/_EDID_VIZ_0067 b/data/_EDID_VIZ_0067
new file mode 100644
index 0000000000000000000000000000000000000000..e2cdba04a1ce6f692b3c59d03f18553d549aceba
GIT binary patch
literal 256
zcmZSh4+ad8R_P2NAR)@g+~B5OVWc9vD9CHJ8jrh|>Ny5RG{9ulAW>+c>ky&i%CM_L
zk%2)DsP!*{g%5uaKLeKn7yw27Ft{2U8Tz^+L<AThl2DRyA``Prp~nPP7G@@PHb!Mm
z_P}OF28J|d9tHsh1{7O5LAEf;G86?~kW<Lh2!-0)!*!uc;eoDzfZa5Rhy<f7&}}ke
Q3K2T05RrKxf8hY@03Y`+0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_VIZ_0092 b/data/_EDID_VIZ_0092
new file mode 100644
index 0000000000000000000000000000000000000000..8662e51802f52351ff85e5d3500cdcabb087e0b8
GIT binary patch
literal 256
zcmZSh4+ad8R+AVQfxtnOk+~t(q=M`E?j@mqv()(9y_TK>%YbBIfXS*sqR>LuAwtKM
zVG*|x1A`m`1H)eiBVTzpeg-ZDFaV1DX9)H7b#(MKFf;%HL!ihX2452+gJ2)18pbjv
zX0<|ZMrIb)2@0Y@!XomTob0Tk;Q<Wn49$!T4C%}~3=Rw$x(NG1q4qJ#G86?~kW<Lh
MfQbN2Cmoys05|F?0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_VIZ_1018 b/data/_EDID_VIZ_1018
new file mode 100644
index 0000000000000000000000000000000000000000..0c7373f4b6f86bf90ed3f46da7a13d8ccbc46dc4
GIT binary patch
literal 256
zcmZSh4+ad8RuTe?K)@lz$lOrrQla%|?&6T3nQHv*UQ5q0Ts#1hLjaZ%27^xpQ4Jd+
zx)^q@aAIJPW3p<HD74UZh|qC`iZC!R{9*7lHPv-7;8FkspvYeaaUcF3H3p~%V+a#-
zUSW8AN^DYGvVf9;ydo=$FgqJFlc12O7^6`*8&C@raI&+DvIjIXGBD&b^Dr1NSlBFx
zj%G*z@);Q1E-*0MUJ}~xKfO<lM<gJ`nPsg8Nc<7Q|EGM3X$h&1+4vbBvpxWcp@R1S
D-1a#D

literal 0
HcmV?d00001

diff --git a/data/_EDID_VIZ_1018_2 b/data/_EDID_VIZ_1018_2
new file mode 100644
index 0000000000000000000000000000000000000000..d7895ce31192b67641482fb8ebb8208d471a63ac
GIT binary patch
literal 256
zcmZSh4+ad8RuTe?K)@lz$lOrrQla%|?&6T3nQHv*UQ5q0Ts#1hLjaZ%27^xpQ4Jd+
zx)^q@aAIJPW3p<HD74UZh|qC`iZC!R{9*7lHPv-7;8FkspvYeaaUcF3H3p~%V+a#-
zUSW8AN^DYGvVf9;ydo=$FgqJFlc12O7^6`*8&C@raI&+DvIjIXGBD&b^Dr1NSlBFx
zj%G+;WM=uv=yrjD;r5cye*fuxYCIwVA<isoH9*=PG5mkZmzb82`k0NM@iFTIs8LAN
FdjJ|sIspIx

literal 0
HcmV?d00001

diff --git a/data/_EDID_VSC_0e23 b/data/_EDID_VSC_0e23
new file mode 100644
index 0000000000000000000000000000000000000000..4a8eccc3fa4311aa085c663fca3d7a300c4fdd5f
GIT binary patch
literal 256
zcmZSh4+acT$;y0;K%gwb$lRbWSD{z&by=v#Y&D^Pkp1r)Rys^&nBdUZ(CAR;Z^*^S
zsAxICAW2HyA!CCX!z~R#1_l`h28RC(L5}W*2F9ia29_4)TtJb(3`P|ayA&C?6u<x|
x@`oWT!pO+XqC6KY#@Nop$in<LZbDol&@>SdsA+Nw($Pht!_Y;5rcn-#0RYMAG64Vp

literal 0
HcmV?d00001

diff --git a/data/_EDID_VSC_0f1e b/data/_EDID_VSC_0f1e
new file mode 100644
index 0000000000000000000000000000000000000000..fd1e40b2854994e850a8cc0615c543c88951895f
GIT binary patch
literal 256
zcmZSh4+acT$#VRRK%gwZ$h<&Fx?<O@)TLn_GgU+bLiWFJXl!V7DD+Q^bd5BO1gSF6
zVwe%gpygmtAj}ZNC&<7c$H2hwpCQn~)WFQx)X3Dx%zz6h@|VFVR4#~*flC1lfFgew
z!W_*Fj1_`igFIb>xfm}oF-s>YbJnvrGcquwGxIPgFf`~oGYYgkV&G?BFk^6dk<7p#
fB_+$y5O_gG!J)yF!J!2xA_FuE20~#Ba_9p9QS2@O

literal 0
HcmV?d00001

diff --git a/data/_EDID_VSC_2034 b/data/_EDID_VSC_2034
new file mode 100644
index 0000000000000000000000000000000000000000..c52b9a346530bad0bf9c4a38c70b8000e75d898e
GIT binary patch
literal 256
zcmZSh4+acT$tDVnK)^4}$g<T&slq-jb!CXpTs47!kp1r)9v--OU^Bx?hm{8!8yXoJ
z4}`@rELgBWGr&N>lp!=gk%2*qfq~&aLujO_p}C={fq}7sITujmFN2Y{M3f|pAhW`8
z>;E=Dkv|M!0Y>I#77D?sMVYC^j0>2Ur9b*jU}a%u;ujK@lUGnwVpQg=XK!X?U|_Op
zkSMg!b%@Y$g;*lTC<_#k5mSiJQH6-iW0Ykm3cMhvkf#v}Rnx<Dp-bU`u7H5uG>C`<
X(3}fJKyw6iTpPfSl><5i3YGx?5i3Ih

literal 0
HcmV?d00001

diff --git a/data/_EDID_VSC_bd2b b/data/_EDID_VSC_bd2b
new file mode 100644
index 0000000000000000000000000000000000000000..568b5ec15f8ee5499c2a3d3cbb6c7300d392eabd
GIT binary patch
literal 384
zcmZSh4+acT$=Z7vfq+Atk-5P@x<W7i>x$s$+3ErTA^YDqY-U*Lu=2oEh6xUh4UG<s
z3`|xH5``AJ4iP%840m}185rak7#RLDgqTGb8XH&`7@3%ua{)#EG8lPF1PL;5DS!b`
z<PSrbqmhxJkwS24QD$l}!*m9y{gKmFOzhukT>M`KXg>o(1((P4h0!4k)P%hPfZ9MV
zLk2)00U$;Ne;7RTQc^1vJbYb176K(P)u4$m&MXiDI-QwOB$bDe!JgZnft^8~!Jdtq
Xfr){Yp^=$InUjUF9Mu}C@+JTP5I#Qv

literal 0
HcmV?d00001

diff --git a/data/_EDID_XXX_001a b/data/_EDID_XXX_001a
new file mode 100644
index 0000000000000000000000000000000000000000..1adf346f1ba604c90f037ad06bab33c3400403c5
GIT binary patch
literal 256
zcmZSh4+ad$5>gC|3=9lH;*87<ilP-<&R1uI2lc2c2866X$H0gN(i8(W1Tsh)I24!x
z^#Fk!5DS1=Fajj<m%-eZ-;JMvO92dkB7YcsgDs2#!k{9IMoi2~g#i;-S(w?G*cjzS
zgoVTeMHQ4e+1WFgd4MMF&^^E?%TN?}K~5o0BNSq`To2cUE`<lW0s?l^AR-csvJDrC
tWW*E%bW|I_Li2#S_5=ZS?a&ByIMSyGbRkgJ1O*2}1s(^eITApX4*+&hFaZDn

literal 0
HcmV?d00001

diff --git a/data/_EDID_YTH_0156 b/data/_EDID_YTH_0156
new file mode 100644
index 0000000000000000000000000000000000000000..5587ee8edd12ca0d4fbbf417d7d1d039c60c3d74
GIT binary patch
literal 256
zcmZSh4+acr9bt?NKp-Z=$lM?&RbiK6x-`Upp1M##$o}^Y7Y|%~aq-Voh6xUh4UG<s
z2X0JkSa5*Dq`*MIltG6@kbyx8sPzwnN3gD;shM{GmjVy~MgB8@Ss)$=07d>XNKD|r
zX9E*woWaDL_%V!yRX|uoUO`bw-NVz%+b1?IJ|U5T;W6t024&8A_GX~Np7Jv=@GxXC
z^Dqc7SX2N_O1}|%gt4N7@fjN{V`ip*2G9YF3<fsOtQsT=Ep#0sbW|Ba0~8q;<lcCo
MIkg_>3^-5%0H<O?0RR91

literal 0
HcmV?d00001

diff --git a/data/_EDID_YTH_1560 b/data/_EDID_YTH_1560
new file mode 100644
index 0000000000000000000000000000000000000000..28fd3f216318213b3d459bcf2f947677e9578c0b
GIT binary patch
literal 256
zcmZSh4+acr9SNe0K)@}>$g;skvBECJbZLnHJawUf5Je7#iw8C{tUNH4VS+<rL!(3E
z0Zp@p1qBxJ4h9OQ3_2`=3=DD%3=Dr5B11e3P0a$FxfFl^DDs~H%mVR104Va8!N5Kv
zLzodN&KSeQZ1T}rK%PaJlbyYpk%1wdnTJ7u!9p$lM(hzrmj=eC{0t0i43Ak4Fg#-T
e|BQ{5F*4FK+@L|C&_dTCLPr&0JJ4`4z-s_HTQdOw

literal 0
HcmV?d00001

diff --git a/data/acer-xb321hk-dp b/data/acer-xb321hk-dp
new file mode 100644
index 0000000000000000000000000000000000000000..ddcf44fa135c0b6e41c1704b299816828a6abd34
GIT binary patch
literal 256
zcmZSh4+ab@MRQpK7!nfLq!?M2x@%Ohy_>i=#Al`&e?W*L2LmG-@V&sW;6s63gMor6
z!;yYP1_mhx28RC(%8tQ)Zl11LS^nnwDL|3G401Lmt!9i|3Sa;f`NI(5WNc*U;SCXD
r>}6sWa#ZGIXKZF<U`X|50owFF5M;I_lG%&XKqB%;B0!U<1119iZVWB~

literal 0
HcmV?d00001

diff --git a/data/acer-xv273k-corrected_difdb b/data/acer-xv273k-corrected_difdb
new file mode 100644
index 0000000000000000000000000000000000000000..1fa60db7b2b053691f9b776f6cacbc96d1d9391b
GIT binary patch
literal 384
zcmZSh4+ab@MH|@|z<`lutBq2HrMlpnK+~;id;uZK9t@2RjSY<l8X2ZCY-YH4fRWMn
z0>gq21$GSv3Z@L90g4O^Qd`nMBJvF!3KA?35ujmzIV2`<{m*9PQUC*>$RCD?Fe7tg
zZ>R{<OD1NIkAaNLEJDJpBJva1nPTJO6B6x}Ioa8p85tNJF&xNc=3!7^u&7XANMK}Q
z&X8hYU}Q9?V0g^>nDGfe!wH6GZ0wAQVKPis4HAVGx(*RKt`HZ=G0HL&1zwO-$kPag
zisT<+Sg>G0XaL;RatxLQLX`{*Y79X8n3)+K)H5(JGic0Oz{v8SZvlgTgCavdhaFIe
fm0{Ii#+Ltl{tWC5@<6ef4BZUukl><-jGq7iPx4Oz

literal 0
HcmV?d00001

diff --git a/data/acer-xv273k-dp b/data/acer-xv273k-dp1
similarity index 100%
rename from data/acer-xv273k-dp
rename to data/acer-xv273k-dp1
diff --git a/data/acer-xv273k-dp1-corrupted b/data/acer-xv273k-dp1-corrupted
new file mode 100644
index 0000000000000000000000000000000000000000..a635fdfdcfc13bfaedc5699464a33665ee061222
GIT binary patch
literal 384
zcmZSh4+ab@MH|_I`x#n|WEfet+9*|6s|&6PG~KGk7Z9TC!O-Z?*wA>Okzp#sW`>Ig
z7#V#pFf8~`VAo)vV9F30pvb@=wIvNCBHzHFAi)9=VPIhR%VRL%|Nm@8E(I_Eiu_@S
z2s1J__J)cuDKas8d<<k{W)Tu*6_KC7&J-ILpO9#;%*oE)%*ep-h~YpkGY^9RgGGe`
zLjofcbA}WH10$os1ct|~j~SovGaO)e#>UQ=7$(Es)DTi&;p@Pm@Pj7|>>`Kf3|R{n
dWCd_2%z(Nm{}9811q(t0;I5Vf>K|bL0|1)VZ2<rP

literal 0
HcmV?d00001

diff --git a/data/acer-xv273k-dp2 b/data/acer-xv273k-dp2
new file mode 100644
index 0000000000000000000000000000000000000000..08ac45b3a3a5013c3adef432c6eacfe3b3c65f51
GIT binary patch
literal 384
zcmZSh4+ab@MH|_I`x#n|WEfet+9*|6s|&6PG~KGk7Z9TC!O-Z?*wA>Okzp#sW`>Ig
z7#V#pFf8~`VAo)vV9F30pvb@=wIvNCBHzHFAi)9=VPIhR%VRL%|Nm@8E(I_Eiu_@S
z2s1J__J)cuDKas8d<<k{W)Tu*6_KC7&J-ILpO9#;%*oE)%*ep-h~YpkGY^9TgGGe`
zLjofcbA}WH10$os1ct|~j~SovGaO)e#>UQ=7$(Es)DTi&;p@Pm@Pj7|>>`Kf3|R{n
zWCd_2%z(Nm{}9811q(t0;I5Wq*iax;$-uzOs4;5+W6OWO1q}KPiVXQ2b_~o6tPBsn
jF|gFLM*_v<fnt&jj6hK}1`c+1X66U=K+jMPrc3|;`_WSY

literal 0
HcmV?d00001

diff --git a/data/acer-xv273k-dp2-corrupted b/data/acer-xv273k-dp2-corrupted
new file mode 100644
index 0000000000000000000000000000000000000000..2acbe16e41aa462dc64e9422d3eeae91de30420f
GIT binary patch
literal 384
zcmZSh4+ab@MH|_I`x#n|WEfet+9*|6s|&6PG~KGk7Z9TC!O-Z?*wA>Okzp#sW`>Ig
z7#Wq$Fa&%kuxpSIFl7i0P-I|`+LFew;6s6Y1BZeH3q*v0f#ENY!G!<+vl+P*zyK)n
zhan=&$lTZ)D#CPviP__0AR{x2kT9!=`~-HU*tqzFM0;gUcJ^jQ28Krr2XdKt7!(*J
zDijzJ7@3$eq!<_&84V^dJZ62&_=KO~0K+pjcE-do8KBu{z~MPV)`A6D0UQc5pf1Wk
V#IRt&g3tg11*og#81e_&egNS}TLAz7

literal 0
HcmV?d00001

diff --git a/data/acer-xv273k-hdmi1 b/data/acer-xv273k-hdmi1
new file mode 100644
index 0000000000000000000000000000000000000000..5de1ca80071cab5df9da248e65cff96621201dfe
GIT binary patch
literal 256
zcmZSh4+ab@MH|_I`x#n|WEhznY?Lar)CJcBnr>C&3kcc&zM;^+(V?-S@jxTPREEtA
z7Z3PeU|8^>z^=hS!IU91K#_q#YD*eOM81JTL4pM$!oa}rmqEiuZh;L0mjW07MgA~E
zgc+F|dqYJS4=^zYd<<b^W)Tu*6_FQUXJd+ui%&>YP*hUpWM^+?WMIf;=3x+Eu&_~J
zNMK}QPQMX*gt4N5IYWwpfss+e=GkM`$Ba+-85$U$v9U8IhRHBlHAoa%=sHB`xI$be
Y*TZ$8OW}d8fPmdJh=>Hx9WbyG0BxQ^0RR91

literal 0
HcmV?d00001

diff --git a/data/acer-xv273k-hdmi2 b/data/acer-xv273k-hdmi2
new file mode 100644
index 0000000000000000000000000000000000000000..7536555cf50a8c379d155295db021b686fac6376
GIT binary patch
literal 256
zcmZSh4+ab@MH|_I`x#n|WEhznY?Lar)CJcBnr>C&3kcc&zM;^+(V?-S@jxTPREEtA
z7Z3PeU|8^>z^=hS!IU91K#_q#YD*eOM81JTL4pM$!oa}rmqEiuZh;L0mjW07MgA~E
zgc+F|dqYJS4=^zYd<<b^W)Tu*6_FQUXJd+ui%&>YP*hUpWM^+?WMIf;=3!7^u&_~J
zNMK}QPQMX*gt4N5IYWwpfss+e=GkM`$Ba+-85$U$v9U8IhRHBlHAoa%=sHB`xI$be
Y*TZ$8OW}d8fPmdJh=>Hx9WXEx0CPS<0RR91

literal 0
HcmV?d00001

diff --git a/data/aoc-c24g1-dp b/data/aoc-c24g1-dp
new file mode 100644
index 0000000000000000000000000000000000000000..331b910ed221574011d853e5ce45aba3052ce030
GIT binary patch
literal 256
zcmZSh4+adZj~P|oOk`nDmt|yGY9d=<Etj|=G-$S}U_i+J_Y4;gG&UG!7}mIExYi_Q
zB-SulHAoa%=sHB`xH536Dl#z0{i$o{D6kN6kWes%iZC!R{9!OMaW@QiH{ntM0ieiV
z27?I;7AP`81QZxQGcjv?^kHOX6=4yU7h)2eV6V){&fd((z>vz!!yv$rA;rMJ$Y?Nu
zp)J2*L4k#Xg8|(9f6*WjQzQ{aS%#v(3vvp18lg}()aXrEkRT-oRAUAa0UCz_v;YlW
BI{^Ry

literal 0
HcmV?d00001

diff --git a/data/aoc-c24g1-hdmi b/data/aoc-c24g1-hdmi
new file mode 100644
index 0000000000000000000000000000000000000000..45d1c4be90a385ea0c65b1f7af520810406ea8ee
GIT binary patch
literal 256
zcmZSh4+adZj~P|oOk`nDmt|ybFp;g$l1p3>8Z=u~Fd$_Adxnb#8XF8V3~O97Tx$|D
z5^I>O8YBuWbR8meTp2i36&V=h{?s*e6j%s3NGO;>MHm<u{xBGsxEqGMn{X+B08r#F
zgTVy31#%1!0R_elOw1Y|eFWrLMOcKHg_r~x?Ugy%*_#;|7*d&e7z7wHq!<_&84V^p
zYs+s~P+;NUU;sD&Uo=R>6iH;Y(t-s6Em8&s3T6;DNY&^~Sdbtk2UG(S0lEPhd;|ct
CoIC*l

literal 0
HcmV?d00001

diff --git a/data/apple-17-inch-studio-display-crt-override b/data/apple-17-inch-studio-display-crt-override
new file mode 100644
index 0000000000000000000000000000000000000000..0efe5a4db7d5cc3c72594f4a2ee2b885d3c21fc9
GIT binary patch
literal 128
zcmZSh4+acu0!(umfq;R7kugI-qUQxm=Ynvr*=j-_K8D&2hLNt3iIFQEKq^2WLCnFy
zus~Zu!9kh9;*|gcgM^2@gHh53BL{~=!cY+g28O>31`Fgu1sJ##zyK)nhatG6G$k|N
NrMMuc($Jh?9{?LiA^`vZ

literal 0
HcmV?d00001

diff --git a/data/apple-applevision-750-override b/data/apple-applevision-750-override
new file mode 100644
index 0000000000000000000000000000000000000000..1a0599105571011e21335711a1ba2ad30f8d39da
GIT binary patch
literal 128
zcmZSh4+acu0`Hg@p+G}HqU{Ca$pzt_Gt`AVd`z<&U@|aTfUn_z!UI_W3kzX}8YMvn
q202U-1_p+|3<ec)!Ga823Sa;f`NQB?kQ0_!oSC0zZfc;wFdYCrMjinG

literal 0
HcmV?d00001

diff --git a/data/apple-applevision-850-override b/data/apple-applevision-850-override
new file mode 100644
index 0000000000000000000000000000000000000000..4d5fae7f6e936351df0bfd46d2d29ef325a65433
GIT binary patch
literal 128
zcmZSh4+acu0zu4-Ai&1RsG%m?_JZ-`f^g3n>Ovkq_Wv6g84V*{BO4<VBUk!^6bbM(
z98h>5D_~(E%uu5w$iN`?Q&i!HL4>@5f&)y1fq~&KgF%H{+<yix1uy`L{9$k`$O+3V
O&dkrVFg4&}SONf+6C(it

literal 0
HcmV?d00001

diff --git a/data/apple-cinemahd-23-2006-dvi b/data/apple-cinemahd-23-2006-dvi
new file mode 100644
index 0000000000000000000000000000000000000000..e36f75231670084b76b698ba511d5d501dc17e06
GIT binary patch
literal 256
zcmZSh4+acu0?Lz;D;b!?1Q?kc4CO2I{<<y>_nN0F91z05z;Ka)5d~=2G%P6CpzL6v
zV8-y?Opt*=3aIEmgOQ_|k&%(JNvOL4mjY1a4})`NUTSWlf`<#2f&xec4KRLlU}OS`
Zm8mc;W%&P}SxRaJBUp_Cn4~!o4*<ubAprmY

literal 0
HcmV?d00001

diff --git a/data/apple-cinemahd-23-2008-dvi b/data/apple-cinemahd-23-2008-dvi
new file mode 100644
index 0000000000000000000000000000000000000000..5c9831129adc92d112e15b832a262673d5f14888
GIT binary patch
literal 256
zcmZSh4+acu0y2~4ePd)26=Gy=FqE&*`|G+m+-shya6kwH1H(lIMiii7)3BgmgR+Bx
zf*HemGeHIhDWIbN3`UL?MutWKz7f8DTna#uKMc;9d8xUH3LY+83JM?*G{E@PfsqL$
ZR;R+al;Qt>W+|x^j9@hmV3OuUH~^^)A^`vZ

literal 0
HcmV?d00001

diff --git a/data/apple-imac-27-inch-mid-2010 b/data/apple-imac-27-inch-mid-2010
new file mode 100644
index 0000000000000000000000000000000000000000..48e0c219769bde1d3f36e27dadbbdbc9fe7ef1a9
GIT binary patch
literal 128
zcmZSh4+acu0{7-H0D+hYBg;|)=?bO%jmtxQ=Be@ogaAbu(SVd$!-4_}c?SapQ-<5z
pf(#5&Kt)W9Yyym2j385>;17dyeolUof{(Kcmx6)<Oc;sw004MP76AYN

literal 0
HcmV?d00001

diff --git a/data/apple-imac-retina-5k-27-inch-2017-tile0 b/data/apple-imac-retina-5k-27-inch-2017-tile0
new file mode 100644
index 0000000000000000000000000000000000000000..109bb1441bc8c0a1044019d27e75373b44b8d1af
GIT binary patch
literal 256
zcmZSh4+acu0&?r>k0uuyOEI!+l~bxv3MgC`=(t&pHz0(8fq@YX9NojPV1Yx>1_K2v
z2JHYr1_r7ADux9O3{DdeB0z0_7&3hmlerY204VaG!Q9Ni$->px+|Ak4$e8hDfp8@=
zgAjvQlK@bX)1DishJnE`AV3)8nn-2_8=ngdEdTlDGw3(SGvssFGB7c)Fr1mlz*5fx
z5o2dJ28)Hp0o8Fr#OAYVfW_(?C4LD29nT<CX85P#_kSjVj-<=Ke*F0N|3BCshDj3u
Df2u+O

literal 0
HcmV?d00001

diff --git a/data/apple-imac-retina-5k-27-inch-2017-tile1 b/data/apple-imac-retina-5k-27-inch-2017-tile1
new file mode 100644
index 0000000000000000000000000000000000000000..62153230ce5afe913701a129932954d16288fdef
GIT binary patch
literal 256
zcmZSh4+acu0&?r>k0uuyOEI!+l~bxv3MgC`=(t&pHz0(8fq@YX9NojPV1Yx>1_K2v
z2JHYr1_r7ADux9O3{DdeB0z0_7&3hmlerY204VaG!Q9Ni$->px+|Ak4$e8hDfp8@=
igAjvQgMa|Te@=UDpc)1S$AAD~kZU5rJQ@;PCjbB`w<rMs

literal 0
HcmV?d00001

diff --git a/data/apple-macbookpro-16inch-2019 b/data/apple-macbookpro-16inch-2019
new file mode 100644
index 0000000000000000000000000000000000000000..ee4535da3090340233a224f70ff9d3b51db63ca0
GIT binary patch
literal 256
zcmZSh4+acu0xk;}fIvl-k!7orSOpXR#&to?8`O9MLV%)-XyExohJXVN<^>!IGdLoz
z3otN90TumWaL&)kFH-PvcHvS`PymVmCC~tx2xE1DP$e@%eWU#^0S0D934RT6Gz~rh
zhGqugA%?oaUXCVQ3Jh)rk(MSFW(G#4<^euo<`#w^s}vOK8#RF@FflR+GB7YrV76y5
kW^G`1=iJK6Be+ETufj=PW;=n<7v)jQQeNyrvSIB6040qv0RR91

literal 0
HcmV?d00001

diff --git a/data/apple-xdr-5k-tile0 b/data/apple-xdr-5k-tile0
new file mode 100644
index 0000000000000000000000000000000000000000..d3fdc898d7a0c4c060dae668d5e19a23047878fe
GIT binary patch
literal 768
zcmZSh4+acu0!r(6czC%PWf@tHx~W$%@K0P9<h((RKOlsGfq@YXIGtk%_)rkqz@bpV
zu)9-{fk6r)BG$yA&;b=$5W^6#V1Z=-hr$jHh#H_le;5La@?A2E3vv=GBV2-5e=#xh
zH#}x-V0gyH&bT0((FSaAIMCo3P-AStB5fdpc_79(f<-!kB0HcWK!eEyj0HlK3=EnK
z0<t!i^SBTAI&AUWb9Ehma3muGPmpvRe}lLMuRw+0?)padUjhs)j0_Ay3}Q_J3=I3Z
z&3VCgItBzNgF~*4fz^s>QX>O1g9gxrEdTlZ8Q2@-8S*(o7~B}x8UF2N;P}s34i>ZL
zE?`IkiZPT;0Nc;Z5bzE~x`-hKDE$pZ>=@GyCU%D3C}J_pe$4C)A5p~OnFE1h#DNVk
z`%{kOFtYp?hBz7Kyrn2&5I1c_5repCABq^nO{-DFaJh*KZhyo##+G_<i2dfg%?zbL
t|GR!;WI>3vF;oD>f>6Yqm`#9w1?ojo_lfxlP|OEK>>Kk7tYNZc0sw$Xp8)^>

literal 0
HcmV?d00001

diff --git a/data/apple-xdr-5k-tile1 b/data/apple-xdr-5k-tile1
new file mode 100644
index 0000000000000000000000000000000000000000..68d8c24be053f20bdf0a8c37f2d1a83f9f2a7d1d
GIT binary patch
literal 512
zcmZSh4+acu0!r(6czC%PWf@tHx~W$%@K0P9<h((RKOlsGfq@YX0EGmA7!?pB@`oXy
zDBmTsxF9F7GQuT@xtWQXzu_@!1H&^mcE$zSjHo8kp2t!kRLQ`g$sizWV>yrefUm<A
z&plVy@drmTGVlaR$MH9aTkr~0`0cK5Wd9|=zyfri5QA8QfB?gOZgXC+^Be;Ll))ia
z$G~dEG^vq+nL*^=ZU&D3oaGGc4e|{3+yx9t4D8swvT_30erAS%cPLtl7*c>*zM+U6
fW7@&Q&hQ&WEQZ;SnVsPyidZ~zAW)1ruweoKgkDDh

literal 0
HcmV?d00001

diff --git a/data/apple-xdr-6k b/data/apple-xdr-6k
new file mode 100644
index 0000000000000000000000000000000000000000..461b940c5c553835af396ef27db966c0ca4ced20
GIT binary patch
literal 640
zcmZSh4+acu0=ny%_;^(rWf@tHx~W$%@K0P9<h((RKOlsGfq@YXIGtk%_)rkqz@bpV
zu)9-{fk6r)BG$yA&;b=$5W^6#V1Z=-hr$jHh#H_le;5La@?A2E3vv=GBV2-5?lCd*
zH#}x-V0gyH&bT0((FSaAIMCo3P-AStB5fdpc_79(f<-!kB0HcWK!eEyj0HlK3=EnK
z0{8EQ=nGrAc(1K3D7<L6{|6%jPmpvRe}lLMuRw+0?)padUjhs)j0_BQ46Ig6lNuSA
z88nXMFtYp?_Ge&kkY}*xE?`JvU}uQ<#@JFX4iPiwZDuG1is1&|CV=f{W=O$i)>0Jn
zix^UXW^F|gJI1twiJf5|idYP@A2U0{Y80_}=0KnrCg6hGkImh#-xygCeraQ<0NNjf
fBId+w0yGz>7fIbG<|jZg9~7}~%rCIozhwddU5$nT

literal 0
HcmV?d00001

diff --git a/data/apple-xdr-6k-tile0 b/data/apple-xdr-6k-tile0
new file mode 100644
index 0000000000000000000000000000000000000000..f6e2c47aba1a62e12a6ae40c24a84bff69e0b6c2
GIT binary patch
literal 896
zcmZSh4+acu0($G1_;^(rWf@tvx~W$%@K0P9<h((RKOlsGfq@YXIGtk%_)rkqz@bpV
zu)9-{fk6r)BG$yA&;b=$5W^6#V1Z=-hr$jHh#H_le;5La@?A2E3vv=GBV2;mUNbTC
zH#}x-V0gyH&bT0((FSaAIMCo3P-AStB5fdpc_79(f<-!kB0HcWK!eEyj0HlK3=EnK
z0{8EQ=nGrAc(1K3D7<L6{|6%jPmpvRe}lLMuRw+0?)padUjhs)j0_Ay3}Q_J3=I3Z
z&3VCgItB#jgF~*4fz^s>QX>O1g9gxrEdTlZ8Q2@-8S*(o7~B}x8LIv=aO~%H28)^V
zHZzn0#Ta@ffbC~yNcp#$f#W}CIau1ByMQ4HDE$satcW26DE19S>=@GyCU%D3C}J_p
ze$4C)A5p~OnFE1hm|!y8er(PwKyh*#Lj}<OauhKqW)q;fsCqv!KLLuBps4%C`~s`}
zb#VKS<S?@Q7ls5G%>PSK#326PiXsN_|2`Bki2qlkh~e@-7u^1cZ;UPV;t=~`(c}7!
dkp&?J@qZAC7{vcTy-4aH{`Wx<!{z@i699XFzX1RM

literal 0
HcmV?d00001

diff --git a/data/apple-xdr-6k-tile1 b/data/apple-xdr-6k-tile1
new file mode 100644
index 0000000000000000000000000000000000000000..f402a858b194bd17baff88e345bfe3f374adf191
GIT binary patch
literal 640
zcmZSh4+acu0($G1_;^(rWf@tvx~W$%@K0P9<h((RKOlsGfq@YX0EGmA7!?pB@`oXy
zDBmTsxF9F7GQuT@rG$x@zu_@!1H&^mcE$zSjHo8kp2t!kRLQ`g$sln5UWmT1rHl94
z+JeH1hWmdoGVlaR$MH9aTkr~0`0cK5Wd9|=zyfri5QA8QfB?gOZgXC+^Be;L^uZxl
z$G~dEG^vq+nL(uLF9XMZZf6Ge26+Z^-e!hU26pUT**^hnKQlwhzugQR|2fOSTI{(C
z7?OZm-l2#UF{A*+zM+U6W7@&Q&hQ&WEQZ;SnVsPyidZ~zAW#ewOorQ!&B+BQ-e_Z}
h0NP)UBId+w0yGy@?<eLbK(P`Ob>Em@V70$)0s!#&X8`~J

literal 0
HcmV?d00001

diff --git a/data/asus-pb287 b/data/asus-pb287
new file mode 100644
index 0000000000000000000000000000000000000000..d08cb5b0897068b508a4e1073580992997edbb5c
GIT binary patch
literal 256
zcmZSh4+ab@nTs^u9%N(?kYHq4YNu3TC9`#Lxc>rm-hhzB91Ir^G&(dkOl8>2(0G6m
z2m&rJEcj4h*I*FQ#gH4S$iN`QQo>;HsUWIh16+iGf#ENMT!6#^8x}!^4?iqE*Z@WT
zFgON>1}g+O8CjTfDJU>%GBK+c`ZF>y3knIdh_K2};NzE-Q|1(BZ)Rj*$YSPU5MW@a
zP+(x_;kwYJ@IY5Uz-}7ELJ3A$hN8d=ate7Gp%4){pvayepvVr5PzSK1<bb*+C^#4@
P@Hjx#NC2IH0$u|Ew_QO2

literal 0
HcmV?d00001

diff --git a/data/asus-pq321-dp-tile0 b/data/asus-pq321-dp-tile0
new file mode 100644
index 0000000000000000000000000000000000000000..9914442d9f110a352b19ab076954671d8c5dd446
GIT binary patch
literal 384
zcmZSh4+ab@nTw1VfZ)G4Bg;}Z^$I0{uS+8W7pn>dgzSIcFqNV4K%+xr!%Bw<4x1So
z8CXghBnk_n8X|PM7-BmG85rb%TK_VL_)7H1F>oosME)=Y1R5I|aw$LnP|ZJ}ED~UP
z%)~5n&|iR6UPOUKn3+jPkd0kbOqr9Nv6+zpWXpvjpe+JAT@4Uhn5=;ITIf1N=(sZM
z>Qn^Ut6|fypkRZtgMoq>L_`YY3!;H!fsiBvgAjvQg8&0VJ$pU}Sf``2=OUxy-?M~V
Ki8hE#g%befMLq!l

literal 0
HcmV?d00001

diff --git a/data/asus-xg438q-dp b/data/asus-xg438q-dp
new file mode 100644
index 0000000000000000000000000000000000000000..f60715a26a8b604198366b365bb7a7f58db30060
GIT binary patch
literal 384
zcmZSh4+acun;$wyI59Cu$uhERjWeyV-etPZ-+h(3KtRa;^9&acY-X6s(Ady;pwPe3
zfsxVo0>gq21$GSv3Z@Ke1&tUOq<AwL0t$d4910vf5D^9jhQAC3761R|Fmfq?0Z`-*
zgJW=LutJ2piLnJxlu4P1+4ZA8BQuMzybzP%1b#kQxr9VzPImTYMh1p-W*!Cs1`CJu
z8?i?iD;gMbr5G5Pm<=izm`gM`^d7T5V0^~L&R85Jj%oRiREB^L7V-`p3KA@E=K$?T
v2P_3bl?)8bj2g2RFtYsTo6n%%V9$`xVave8z`|e<&B%!^hHe05{Ie4PJ~T@K

literal 0
HcmV?d00001

diff --git a/data/atlona-athd420-hdmi-override b/data/atlona-athd420-hdmi-override
new file mode 100644
index 0000000000000000000000000000000000000000..2b2ce6ac774b9ed5918bae77c51d73700837c448
GIT binary patch
literal 256
zcmZSh4+acuJ>e{jKwv1w$lTzjUcvWl#^MmKnQHvre(TROG#=Q@Fu|eFtI=Vl!&HVw
z21Z$iqQDDs3V9l#3`hDD85rak7#RLC7=_Ba2{3RefB{hCKZB8hp^>4HfjL+VDDsEF
zF+|tH#l*+}EW&u0iCOZaTMLtbps>6$r#yQzBLhP!GY^9R1D`xYLm-2kfkT5i!=9f&
zD`Yfm8Wt36P<Aj-FoTFl0iCfY2<VI*8letgHF8W=4HAVGx(*RKu0S;c5QhQnMFBuz
I38+9S0M=tW0RR91

literal 0
HcmV?d00001

diff --git a/data/chiyakeji-r1811-dp b/data/chiyakeji-r1811-dp
new file mode 100644
index 0000000000000000000000000000000000000000..699f4ad401c288a1455a6f555b3ff4afd8ab46d7
GIT binary patch
literal 384
zcmZSh4+adplEOv|K)^4@$g<U4qr$pKbxnZrb~WyR5Je7#MuyD{7a3MMG&Wp3zz76^
z7Z?_ND6ne?P)Owo_E%(JkOFG`57LhU{xG<wre^2oDMT2V2NdN4<^D1l*vM}&W8_i*
z1ExSGW|NQpjLa-T!mJ|l0!*=S@d=5_ob2q)j0_AJKvNkR4Qv=5vmR!A%+KKPjE$W!
zF-*o6$@b6ypzRW2aSRI<EYJ)vP%vcxi-6oi47gSxRLQ`=%xKe5$=LE=*q$-I!JfgM
z+m?ZefrUXJmVxCz=X?hJ26>>E22hNX;m96ju|TjGI|CO-BLfEu0}GP?F_t3Ke3<|M
D)NV!r

literal 0
HcmV?d00001

diff --git a/data/chiyakeji-r9a18-dp-tile1 b/data/chiyakeji-r9a18-dp-tile1
new file mode 100644
index 0000000000000000000000000000000000000000..7c80bfff721533640b98de169dd41578e37cbd16
GIT binary patch
literal 384
zcmZSh4+acg-P;_3%}fkbB^X(@+9*{R7pblZFy5}l9T1|(!O+OCnc*VCN{7aViw78i
z!1n^ff)53D4FL+NJfQ)K3=C2X3=IDnTp}VOf=nze4NS~}xqu>n7+eAr0s}o<xD-GD
zDDs!VV8YFtW{eO41*Uo?X48+#ob2q)j0_A>EUW^;BJv7~O6ne-Ufv9`aq&sXDd`!R
z35kyw4m@T(!0?QXl`$!a0mFKUusDVV3l?Yw7$}%Bz#Rm%j}S;J5UONg5MmH(5)fec
z&uPyM)({lp4G9fq2AjLtj4l6#=QHRx$TQe;+cGdQurLV3GO+yTgo$YY#W)#`>|tm@
Zhy{Yh*crGu8W}iP7+9DDu)0Kl0s#LDQvm<~

literal 0
HcmV?d00001

diff --git a/data/dell-up2715k-dp1-optomedia-cmv535 b/data/dell-up2715k-dp1-optomedia-cmv535
new file mode 100644
index 0000000000000000000000000000000000000000..bbe2c5140622f54853fd35203eca660d8aae6555
GIT binary patch
literal 128
zcmZSh4+abZYqmKATUr<hNiwo*wNa|DDpFk&V7y(8J0L`ngQ1aOGs8uOl@5&!7Y{H3
z!AFM+3yNN-88lq5Vu%P)WMB|sU|{&q;AZIM>}zTgYG7d*%mozr!{FlT<D(E7U}SD+
R>J1Y43&dc+r2qm9-vKOnB>?~c

literal 0
HcmV?d00001

diff --git a/data/hisense-h9g-hdmi b/data/hisense-h9g-hdmi
new file mode 100644
index 0000000000000000000000000000000000000000..81783c5721aa8474b316d1369dbbde66da0adedb
GIT binary patch
literal 256
zcmZSh4+abhiwzhU85kINWEq(oiXAJs&X+6>_t~J#>EWZu!O(c1(V?+{5e{~oV+i<A
z5Y-?d(8aK;Ly>_&j>)P)qR>LuAwtKMAwaeSC;~L>4}*tiu&ZCNE0+QY07d>XNO<#i
z*f2l@6c{6zn9B>I664|%VzaUtnOIl_1cgQ96%>_(m{Ze|l2eR0+1W+e1H#!DZP^c`
zvoOckF*XC8`H11?W7hwSdCWWv3Jel93JeX5Ow249H)4-4RsfmL1l=w$6f`_$<7Ir!
e2xPh>7uDqC*F0tHZkfRNgg=uZ0q7JkNCf}|V?qG{

literal 0
HcmV?d00001

diff --git a/data/kds-vs555-vga b/data/kds-vs555-vga
new file mode 100644
index 0000000000000000000000000000000000000000..433b38d8d4ed6f3332d23486e89ae2b992fda3e8
GIT binary patch
literal 128
zcmZSh4+acEUnE!=85kHexEL8KWJDQGuuWPJ?mt~kz{CIl4+g_X!wlC*pfnU*<!o4>
X5SJ_<kPyVd!py+ICIOQnk&XiZzTFf7

literal 0
HcmV?d00001

diff --git a/data/lg-31mu97-override b/data/lg-31mu97-override
new file mode 100644
index 0000000000000000000000000000000000000000..47af3018cc0557ef51f5fd98563a7326e786d60e
GIT binary patch
literal 384
zcmZSh4+ac!xzEZNfxtk5k-5Q5wc>^B$94Xun^k!OLKHa|3LP378V{^IaPa_04I?8<
z34_6>f~bZK5nT*B@)a2vq{8AD7A#nx8DOAb3Kd~sU=RReRPcwv*w8oB(ws{H447J(
zm?b~B2(U0SDs!^4H#0IYq%-q?^w}_3HAoa%=sHB`xIzq+W0Ykm3cMhvkf#v}73tx+
z(53J|S3tmS8bm|_)i%OBp8~;3HU?$}5#|zx_W%6VtiPMX8S*(I8Q2>*3G1d<#f%96
D0)IRK

literal 0
HcmV?d00001

diff --git a/data/lg-34gn850b-dp b/data/lg-34gn850b-dp
new file mode 100644
index 0000000000000000000000000000000000000000..afca8e56333fdf7fd23dc43c2e3f1f4df03b3a8a
GIT binary patch
literal 384
zcmZSh4+ac!x!&axcUTyh<r!JF1}Ij{|5m!*&uO(9UqFZ=Cqtn_V?*PCl?OI6Ts+Xo
zaPj=D<plv(7nlT0P_Qyk@Hb>&kYZq9_{(50;o-voMlJ;~0E+x!@NriN^$7`bba!<O
z;sT2NXD~D{_6zZGwRASIu;60yW@0udROV!7cNbt`W|S8eYG!0$c+7f$;SodDGd5Pn
z#6;U%pxI2U1``-q5^WQ0{jL;TxUj$|z(B!@0d6zUU^2nG0-;I<24+T)Gz-SIeBSpA
W`VI07^I2UPm>4+8G?El;+!FwJ%s~MF

literal 0
HcmV?d00001

diff --git a/data/lg-34wk95uw-dp b/data/lg-34wk95uw-dp
new file mode 100644
index 0000000000000000000000000000000000000000..7fbb03419ccb2a18fee91574adfbf185ffee6719
GIT binary patch
literal 384
zcmZSh4+ac!xeDbSPgoc@Wf)nu1}Ij{<2<-7z-7G}UqFZ=2ScGlV?*PCl?N^!Xk=gn
zg6A~_3ob0s3@}izVo>lhWMGh*n+_6DLK0zMVED^mU@O<|!@#8g20)QN3_k7(9xg!&
zrrsbyrXVI}$wHS2EX<6`ob2q)j0_BqSr0HgW@Baay}+>GLxEj`fkG+|#0rfJhzQ37
zm<Z573c=$7p-N^3W(JJ{S;n^i!WoPb4G9eS9JUPl3>*wQ`WP_8D6|hv`|1e*<9<T{

literal 0
HcmV?d00001

diff --git a/data/lg-34wk95uw-overlay b/data/lg-34wk95uw-overlay
new file mode 100644
index 0000000000000000000000000000000000000000..45cd52ee58bfc02de87033bb9ed6f436440328b7
GIT binary patch
literal 384
zcmZSh4+ac!xr*fsV8F<-H9)bV0m6ZjjA#HTEP$c_#K9E#%V1zD*Y3l>r2qy%HGdd<
z+!Z`rf)q@>L4r(|n3zQzl{wkjn;97x9<v@`c+AEMWYG--76?@`FfcOk*olkrGKds#
kOsMFb$;=?~Oo*}Vzwmqp{RVl4d=6U%CI(JgxG8M{0Ammz0RR91

literal 0
HcmV?d00001

diff --git a/data/lg-34wk95uw-thunderbolt-dp1-tile0 b/data/lg-34wk95uw-thunderbolt-dp1-tile0
new file mode 100644
index 0000000000000000000000000000000000000000..7548eb940aff67fbf2112d2333e49a68121e4153
GIT binary patch
literal 512
zcmZSh4+ac!xr*iSP0S2TvWzTS0~9OfaUNV3;IdwgFCavbgQ3u&v7zz6$^#b<G%_#(
z!SkAe1s4`*1{f$<F(`N$GB8NZO$Ui6A&D?BF#KgOu$61~Vc=2#1E9zs1|N3?50@YX
zQ*V$U^CKo^$wHS2EX<6`ob2q)j0_BqSr0HgW@Baay}+>GLxEj`fkG+|#0rfJhzQ37
zm<Z573c=$7p-N^3Mg|@S`6oOKA_W{1DmrH}Gl)E>Vc^K;ozI}(AkQ$LRfB<vfs;a;
zuxeMG0JdL<L99uDf#E-AJ_lHtd$6x!IVhZgF8R>O!115cpMf3dl6;OppgcQPqsS5r
Gng9S%4od+5

literal 0
HcmV?d00001

diff --git a/data/lg-34wk95uw-thunderbolt-dp2-tile1 b/data/lg-34wk95uw-thunderbolt-dp2-tile1
new file mode 100644
index 0000000000000000000000000000000000000000..50fcae0db30e565e1e11d6896779dafc2ea205f8
GIT binary patch
literal 256
zcmZSh4+ac!xr*iSP0S2TvWzTS0~9OfaUNV3;IdwgFCavLfq@YXFc1g+G8ov(wfit|
zDS!b`(;o&OcLfiZAO%xzkRYRcflwtg10w^EgZvX729W}e2^F0)g&4#d1OyoVbLMk^
p?QswGRV)X&fSEz$Lni~re@=e}_6B)|e2ze%JUel2!K%t=0svNRBLM&a

literal 0
HcmV?d00001

diff --git a/data/lg-55sj850v-hdmi b/data/lg-55sj850v-hdmi
new file mode 100644
index 0000000000000000000000000000000000000000..6d8156c58237cde15302d24ae576a5916806353e
GIT binary patch
literal 256
zcmZSh4+ac!xr_{qARx`i+^`_3g6rMH#UVa3)%XKK7IH8cI=DI{IutrIHh|SIa=c(L
z_*4+pupy$0!J#FYfkBSRszIXALf0We#}z8Vz`*dA!KzZO!-j!N0Stg5e;9n+6+*(G
z0t$@DOw6$#qY@JY<kM1Fgjq$HnS>M+l|&h1<KmN&Q|ujdIK$aR*#kn^8Ex4P<T3Lw
zC@}1>QDA6bWMXDXzY%+cv7&+b5ySb%tOpn#v+*)M;x~TH=yriYP1NG&1c&G}#efZg
R4AKS;1!f3G0bPLrM*+(vKmh;%

literal 0
HcmV?d00001

diff --git a/data/lg-c8-hdmi b/data/lg-c8-hdmi
new file mode 100644
index 0000000000000000000000000000000000000000..0cfd6876a950fe9b6492f007e64139c95b47d489
GIT binary patch
literal 256
zcmZSh4+ac!xr_{qARxoY+^`_3g6rMH#UVa3)%XKK7IH8cI=DI{IutrIHh|SIa=c(L
z_*4+pupy$0!J#FYfkBSRszIXALf0We#}z8Vz`*dA!KzZO!-j!N0Stg5e;9n+6+*(G
z0t$>tOw7q2qY@JY<kM1Fgjq$HnS>M+l|&h1<KmN&Q|uj#IK$aR*#pAa8Pi#qZRHNc
z*D>ZX^Dqc7?66T_XkcVwW=X#hdxWu~f%y@``NymW7#_3nGCtxre$D81fk91zd16y$
XO`2lBhCl{s1BU`Lgwud-0fB=6xDr7D

literal 0
HcmV?d00001

diff --git a/data/lg-ultrafine-5k-v1-thunderbolt-dp1-tile0 b/data/lg-ultrafine-5k-v1-thunderbolt-dp1-tile0
new file mode 100644
index 0000000000000000000000000000000000000000..8eebf47187d336d6c92f20d4b28b82593f9fdb01
GIT binary patch
literal 384
zcmZSh4+ac!xq{KcUzr(rq!?MY+9*{t@K0P9<h((RKOjVbfq@YXsGea6_)uWiz@Z?)
z5D}utz#z3anjv7p0?hz~2m=Gde+Dx{Bfk*mD05$96LT)0$R7qDcZJZLlA=Vn%)C@C
zCbI&eN@fN|1|B<cF<u4{2kw9hznPj00xSn*G*XXw%-%8UL+FpaJUz?|8eg9?u>9xu
zXJBuTXZX+I2sDhHA+C>srJe^O#?EdG76TGQgJ~1M_6sqHH3<Nn%W2OI*6JSYD;N#(
dGBbmS>vjf?|C|sj?70Jh^6W$#Pf%g#1OT#yJ^=s#

literal 0
HcmV?d00001

diff --git a/data/lg-ultrafine-5k-v1-thunderbolt-dp2-tile1 b/data/lg-ultrafine-5k-v1-thunderbolt-dp2-tile1
new file mode 100644
index 0000000000000000000000000000000000000000..675bfb5592ad3d11d44073590bf79a9838582c25
GIT binary patch
literal 256
zcmZSh4+ac!xq{KcUzr(rq!?MY+9*{t@K0P9<h((RKOlsGfq@YX0EGmA7!_cO{AVyT
zH1Z2^jxzT(HZkV{D*waa<E{{zQ&N=ZmYJ8z#rV2FsFIn1k%7lfT#T1N#DP1Y!f&P~
zg8<7x8I9Cq9<z7M`VjhKFHesUgII%r0K<Pydv36$?!mr-(I7`LGl;luXW;nH>CeF4
TAkSdW9SD?XM|Bu(Uc&?cWtJ=f

literal 0
HcmV?d00001

diff --git a/data/microsoft-surfacebook b/data/microsoft-surfacebook
new file mode 100644
index 0000000000000000000000000000000000000000..aa1304c5cf84936b2143e1860da45f71ae0fe73b
GIT binary patch
literal 128
zcmZSh4+aco^~?;+3_!rc$g)&M_`f~_!-8<n*=hnF{y;%SG{DlkBV*$QhXM|c4hGqM
n0t^gtKt+ETJR(9|4ULUmjm$lb1Arob8B9zzY)}QVaDlS`!+aS5

literal 0
HcmV?d00001

diff --git a/data/optomedia-cmv535-hdmi_dip00-v2018 b/data/optomedia-cmv535-hdmi_dip00-v2018
new file mode 100644
index 0000000000000000000000000000000000000000..9b8c5476b40f2b50bef37f7473342e2141c3f3be
GIT binary patch
literal 256
zcmZSh4+ac=BCHG`U?k4S+)(UTp;aR|FVcOsx<EjP{&|K*hDL|Rh6xTU9WEZY$k2Fz
z;{}7kr-G=44G~=o2V{&G8046&8YBuWbR8meTp1ql2?9lchW%l1&d)1LEh<SZ;!;ph
z0E!3zF%n>GWn%XH5E#X(pv1z=#Lku&8=sbxl8~y;S<lX2&u%YrAe@CkoSmVZnTNrF
zVTX<Wi7ZBDmPSVgF*Xi{un30q8?i?iD>@h+F?ch|0v#YDrVyc{%J85aXwST`IEDoa
k7H9?-D3~%dWGFH)NTn%;tqNq2GjQuSW(Yk1R3oPi0G1g;0RR91

literal 0
HcmV?d00001

diff --git a/data/optomedia-cmv535-hdmi_dip00-v20180312 b/data/optomedia-cmv535-hdmi_dip00-v20180312
new file mode 100644
index 0000000000000000000000000000000000000000..f76b7cff409112a85fdaf2611f839981631a946c
GIT binary patch
literal 256
zcmZSh4+ac=BCHG`U?k4S+)(UTp;aR|FVcOsx<Ek4|Njk*42=$r4HFzzI$S((k)iPb
z#|s97PX$p88zQ<Gc6BH+Fvu}kHAoa%=sHB`xH2dlG6aeM4g163oS#>gT2zu+#HFC1
z02KMlAa2XwVZ#980s-SbCT7nMfl;gqN-WGw>}-j#@o7mZ390&=_3Zrh?DirD!dV!^
z*%`{2c^DiRcG&2j$YNw>X>?=|W8+{5i(p8<5qpHOqJ!ZPgEylr&;c@H3K2T05GTzG
gi(^=@V1Z_Ufr2SSL@G@&Y*iqGoPk@vG1S@10pX)b0RR91

literal 0
HcmV?d00001

diff --git a/data/optomedia-cmv535-hdmi_dip00-v20180618 b/data/optomedia-cmv535-hdmi_dip00-v20180618
new file mode 100644
index 0000000000000000000000000000000000000000..ba897780863079d1a77e92e7d4f824669371953d
GIT binary patch
literal 256
zcmZSh4+ac=BCHG`U?k4S+)(UTp;aR|FVcOsx<Ek4|Njk*42=$r4HFzzI$S((k)iQ`
z?*)bh9}4Um3=~WmLIV^T7^FB}Fc^F)h-%mn(Z#T<11KT~H0%$9bADb~YEemQ5to93
z0#M{HgSah!hYbUW3j~ZwOw67i0;5<JlvtRV*aZ?}<I|E-5>oX!>)HA1+3iIRgtIV+
zvon-4^DsCt?6A>4k;TZ&(&)$_#>T-A7Qv8yBlZYmMF+zp25&~$28lu$F@*>nRfq%T
hg~c%}Sg=4d0OUxplcdrV!&U_{$Qiix8$%sA7XX~{N&x@>

literal 0
HcmV?d00001

diff --git a/data/optomedia-cmv535-hdmi_dip01-v2018 b/data/optomedia-cmv535-hdmi_dip01-v2018
new file mode 100644
index 0000000000000000000000000000000000000000..0240d175154a5bcbfc8673ecd864a0761e19c153
GIT binary patch
literal 256
zcmZSh4+ac=BCHG`U?k4S+)(UTp;aR|FVcOsx<EjP{&|K*hDL|Rh6xTU9WEZY$k2Fz
zrG&xYQ$bY2hKMeP12RSo4023X4HAVGx(*RKt_%<O1c4$z!~QTh=jWBB7L}wHaVaP$
z07V3V7zr@`Wnwlc@Q6=oWr>m(5!UCdXXmeHw--4O&cYzh&XC8<1JuD`qrlL>$i&R@
zm^VI!QMTbik&KvvfR1XzgLa^C^B83riUKdlDdcH{GB|7jipceFU6`QYV5q?35X!J+
b0?;}Mph%a(16=_DyJ-wtDnKGoNBji<-Dg1o

literal 0
HcmV?d00001

diff --git a/data/optomedia-cmv535-hdmi_dip01-v20180312 b/data/optomedia-cmv535-hdmi_dip01-v20180312
new file mode 100644
index 0000000000000000000000000000000000000000..98d45c5d9ad69a0a7cc76fccfee4183eb79e5754
GIT binary patch
literal 256
zcmZSh4+ac=BCHG`U?k4S+)(UTp;aR|FVcOsx<Ek4|Njk*42=$r4HFzzI$S((k)iPb
zO9_L)r-G=44G~=o3Wp3C8046&8YBuWbR8meT%jUB!~QTh=jWBB7L}wHaVaP$07d>X
zh=1hh5oZ8#fq?NB6SG;NM|?^vOO(8bus&x!JAXa9y~u%Z76x&4hCF5-1_1^R8wG|2
zMkZ#K$9#!tPkG~064MxE8!i;dh$#r@s5TtwQ)FP6$0*BC6nH^SAx|Te0W2cd!*yYT
ef`g#~j{`^qXt@MXq)Xv}u7H5uG>94rhN%F7F-ZXc

literal 0
HcmV?d00001

diff --git a/data/optomedia-cmv535-hdmi_dip01-v20180618 b/data/optomedia-cmv535-hdmi_dip01-v20180618
new file mode 100644
index 0000000000000000000000000000000000000000..876031e0520b97e7ac76733b42e38ed75313fafd
GIT binary patch
literal 256
zcmZSh4+ac=BCHG`U?k4S+)(UTp;aR|FVcOsx<Ek4|Njk*42=$r4HFzzI$S((k)iPb
zO9_L)r-G=44G~=o3Wp3C8046&8YBuWbR8meT%jUB!~QTh=jWBB7L}wHaVaP$07d>X
zh=1hh5oZ8#fq?NB6SF~~M|?^vOO(8bus&x!JAXa9y~u%Z76x&4hCF5-1_1^R8wG|2
zMkZ#K$Gq_=jIs?Eie$tT1awpzj`S%qFwA3=Whe@~Ag7S05y}7-k?Y~QFhRk=P=Ut*
bBm%Tn0w~g@@IY5Uz-}5ujRepwARq$(GSWr?

literal 0
HcmV?d00001

diff --git a/data/optomedia-cmv535-hdmi_dip10-v2018 b/data/optomedia-cmv535-hdmi_dip10-v2018
new file mode 100644
index 0000000000000000000000000000000000000000..610692f1eb02795fd255e801f7501930a9d93e31
GIT binary patch
literal 256
zcmZSh4+ac=BCHG`U?k4S+)(UTp;aR|FVcOsx<EjP{&|K*hDL|Rh6xTU9WEZY$k2Fz
z;{}7kr-G=44G~=o2V{&G8046&8YBuWbR8meTp1ql2?9lchW%l1&d)1LEh<SZ;!;ph
z0E!3zF%n>GWn%Vt;G33|lA0JBpAf~Wpv0ojS<lX2&u%YrAe@CkoSmVZnTNrFVTX<W
zi7ZBDmPSVgF*Xi{un30q8?i?iD>@h+F?c`XO=FY=+Akxf5TT>W@Sq)N&AhNUh6M{2
kXa*Q4m@+hEC^9fer74E33S^KoaO*c_2t5E)BggO;04CQ(0RR91

literal 0
HcmV?d00001

diff --git a/data/optomedia-cmv535-hdmi_dip10-v20180312 b/data/optomedia-cmv535-hdmi_dip10-v20180312
new file mode 100644
index 0000000000000000000000000000000000000000..4de55e082f30b55180595ce39a80906a1d2aa06a
GIT binary patch
literal 256
zcmZSh4+ac=BCHG`U?k4S+)(UTp;03^FVcOsx<Ek4|Njk*42=$r4HFzzI$S((k)iPb
z#|s97PX$p88zQ<Gc6BH+Fvu}kHAoa%=sHB`xH2dlG6aeM4g163oS#>gT2zu+#HFC1
z02KMlAa2XwVZ#980s-RzCT5QZzG+D*sfn@i2~n&HN-X-E_3Zrh?DirD!dV!^*%`{2
zc^DiRcG&2j$YNw>X>?=|W8+{5i(p8<5qpHOqJ!ZPgZCreG)7sV{W4+-5jv_67tITc
gV_2|Yfo6b#f+<8qDortLRUm_$fm^>Z)YS}?0C5*e0RR91

literal 0
HcmV?d00001

diff --git a/data/optomedia-cmv535-hdmi_dip11-v2018 b/data/optomedia-cmv535-hdmi_dip11-v2018
new file mode 100644
index 0000000000000000000000000000000000000000..12606253deb606b0b36176fb84c50c78322f57f7
GIT binary patch
literal 256
zcmZSh4+adTCZY-qK)@);$lPF}Sn=-N#Kj>#Gu8M5LiEowtaMm;U^By1hVBE64vh?r
z2bioHBnmBb9U^pG86NNnGBC(#*fcCC*r4oSpkT)EKnExy1vKmrgL8gfS!z*9Y7v)$
z0?2#;AVva=o0yoj3VbKXD<~?lim(U^F^jS5bJnx-*R$J;90+G&5NBsdXXXKEQ^d5B
zQI?@7@PeE|o<=Bx!xo?#IYwEayJW-^B6L(49<&2R=Jjx0=u&u~D<EJujbTd#&}s=J
J>lqjh0RZU_JOKaz

literal 0
HcmV?d00001

diff --git a/data/optomedia-cmv535-hdmi_dip11-v20180312 b/data/optomedia-cmv535-hdmi_dip11-v20180312
new file mode 100644
index 0000000000000000000000000000000000000000..111b2a4d79b54a607314dadd37d90351ace51c74
GIT binary patch
literal 256
zcmZSh4+adTCZY-q3=Hgyl8np^CW;mB-c4K_;xki?KOkiP`-YVcD-UdDn99(7pwXd`
zq45BdRf9yKg|0({jw{2FK1BuwISreJ1qB<F9SjuAAR<yg)BZ3x=jWBB7L}wHaVaQ(
z%>T<^;UgC;$Oz&B0pn*TX01Zs3GxbxN~|I*!a~eq?E0Mb?ELlY_96$uSs29G8Pb_~
z7z7v?6fx~&lw~LiydbBLrx6Nu1*0s`T{2<{5jv_6k$F8_7rGQ4=n4qfO@oL?09}Cq
FvjJm-LID5(

literal 0
HcmV?d00001

diff --git a/data/optomedia-cmv535-hdmi_dip11-v20180731 b/data/optomedia-cmv535-hdmi_dip11-v20180731
new file mode 100644
index 0000000000000000000000000000000000000000..ddb9def04a410dfd05bf6c74405f0933dd336bcc
GIT binary patch
literal 256
zcmZSh4+ac=BCHG`U?k4S+)(UTp;aR|FVcOsx<Ek4|Njk*42=$r4HFzzI$S((k)iQ`
z?*)bh9}4Um3=~WmLIV^T7^Il28YBuWbR8meTp1J&88R@)0S)`Z;GCaVmReMjTEwNG
zpa2y4%OGyc-(kZ5;sOEVTP9}r5B^cC3Q8=@OzZ-&@kuEOsrsDt?ELlY_96$uSs29G
z8OoV?7#tXO*yx|gVq|7%bYu`?<6sDjU`W3adxWu~gW(Z_H=``jdKoc=2pv_1T^&FN
j%?pcTSg>G$W&p^EU=gV_#jsU@3~~l;{l*Xxpc69y{enjU

literal 0
HcmV?d00001

diff --git a/data/panasonic-tx65gxr900-hdmi b/data/panasonic-tx65gxr900-hdmi
new file mode 100644
index 0000000000000000000000000000000000000000..0950e03dbb563e236b375ecb4635e93fd0df4a1f
GIT binary patch
literal 256
zcmZSh4+ab-E2k}D1Of(GM&^bFj|#3^{})GiEz%VC^j6?tFmy<C0Lj7t#|s97PX$p8
z8zQ<Gc6BH+Fvu}kHAoa%=sHB`xI#r37#RLA1SIAq7U$<>ChLZTaREjCGKkyqci1p+
zDS!c^EE99ihw#J%0r|94RuKh7B^F_3A$GCYxcH>x6dhi6Mp5>FaCXLY7UpJt28KLl
z9tHsh3mbio21X`kmW&&*M;I#_n3*0ict2+S&-jSn_%Rzl<5R}&mI;in8Qm^0xD-dU
cxy08!69lpg7}6BORs}N18MyTu!`!$B07wBv0RR91

literal 0
HcmV?d00001

diff --git a/data/philips-ftv-hdmi1.4 b/data/philips-ftv-hdmi1.4
new file mode 100644
index 0000000000000000000000000000000000000000..786e68514e5dd7cbeb39e7bd3af41d0cb4806a7b
GIT binary patch
literal 256
zcmZSh4+ad5Jg*o*Ku?yDxnV+J1y?ffve4jZs=V%AiX04^8KyF<beQ1K$k5o(=)lOx
zWYr*1Xrb#6q2tQ1Kr5JmK@KQ#p$I4<pyS#A5n*6p_`?v8k(rZOP^{n<62_$f6#2_w
zV8`z!$H1ik28_K-%)uW+<Ktol<Q0?@Sw&ccg_s4I#MnjI7)?3Z*+tm{Y}pTlvolt(
zCB)Y;rn4|NGcqvbGxIPAFj&~E(9~o|U}R!`#Nhdu^#H?THeSZZe2ED_YlsGQ0MUdr
A0RR91

literal 0
HcmV?d00001

diff --git a/data/philips-ftv-hdmi2.0 b/data/philips-ftv-hdmi2.0
new file mode 100644
index 0000000000000000000000000000000000000000..09d4fdce5a72cf416d5049d4765bd3204fafc6e9
GIT binary patch
literal 256
zcmZSh4+ad5Jg*o*Ku?yDxnV+J1y?ffve4jZs=V%AiX04^8KyF<beQ1K$k5o(=)lOx
zWYr*1Xrb#6q2tQ1Kr5JmK@KQ#p$I4<pyS#A5n*6p_`?v8k(rZOP^{n<62_$f6#2_w
zV8`!f!@#8g28{Vk%w-?L6BFX&Vg=+CloUl+goOl|#Mnhynb{akIoa7o*#m6Z4}`Nb
zR<I?+*D<EEFgG(YFyu4yFbFVM*sRdhWJq9SV$Qe`dxWu~ftl$MgXbfD=EtlD7#_3n
iGCpPOZkfRNn$hh7gNwiS3~TYl&jf+&0-!^npdA2oJwX8g

literal 0
HcmV?d00001

diff --git a/data/planar-ix2790 b/data/planar-ix2790
new file mode 100644
index 0000000000000000000000000000000000000000..954ac0f66a426f4352fba25ba500bf10aab0fd73
GIT binary patch
literal 384
zcmZSh4+ad5eG}9ffq+4pk!7ikVujW9uWJLHH>&XlgzSIc@bJJzhKmO_Gpux2d7!bO
zk-_%@!-5Y5b`1s!rVPRUiVO@=VQ~x#7A(*VK!`9fF#Kf@_u=1?$iSrl20)QN44x52
z=9UIf5hgVzW`)ne0`e>(%tB0ptRn1UY@&>b@o}-rob~L@j0_AcB@70i3Zfb|M07!H
zl4B`pkSGL-MCiaon5=*z7P<}*I<8PPjIs<xffwWy@-#xBB1iWC-RBUr!9c+Z>SCa4
z7#Jc8gjARrm>EU(R5G^w7fxpsZ-{5G=eA|gXJ7|HE{;Y94i*L$CIJQ>uzG3}698Gj
BOaTA@

literal 0
HcmV?d00001

diff --git a/data/realtek-r9a18-hdmi b/data/realtek-r9a18-hdmi
new file mode 100644
index 0000000000000000000000000000000000000000..c26751dabebceeae92a7f12e2bb5bada4ffd214a
GIT binary patch
literal 256
zcmZSh4+acg-9~#Dfq+wrk!6vMQiYwm=$b&&t!jJ$A^YDqTs&~`#l=5U874S1HZ(dk
z9&ot8u;4?1U4wywDMN_AA_IdI0|Ub!1`iisPlZqq7X=TOATBrahAjmax(+&GNNWBv
z7}&J6nK5!HfC1xqCg#9TaV)F?!Xoktic0Dpo?hNQv2pPUiAl*RscGpMnOWJ77_L5M
zJ;0#MS<n8IpMimgA(xqlL4d)cLV+QHk%>9|M(h#BiVntSY^;o#nf@=HFa#`EkRHIH
fFoPvD0O&NijyQ$|3l``Gi0POzKtzC!g@PskPK-+d

literal 0
HcmV?d00001

diff --git a/data/samsung-lu28r55-hdmi b/data/samsung-lu28r55-hdmi
new file mode 100644
index 0000000000000000000000000000000000000000..1b2544bd35fe3fffd911112b41c318b3952c328b
GIT binary patch
literal 256
zcmZSh4+acAy5a(nZsE>`mW<2|_9_)xC$_E)aG9sd9}u$teM6ytBSYhX#)hd3D-UdD
zU}WTY!C>&IAgW<QL>EIvh9U!l90LQxUj`#@xpo@{E(I_Eiu_^l2{p0^GBt$=0Y&~Z
zc$h@_IvW@m8d?Gc86%jOO+R=h3NZ__$O|OID|525H#0IYJZ3$>kj>1)Ai%K0Mu9<r
zG5tpD5ypxJ=12UEkJ(rmnXDQl3N3UUB6M7#)&oT@6ahs9bX*%C4q_=mcVbu^!-541
PGy@D2Od-0Y7#Jb}95F`$

literal 0
HcmV?d00001

diff --git a/data/samsung-q800t-hdmi2.0 b/data/samsung-q800t-hdmi2.0
new file mode 100644
index 0000000000000000000000000000000000000000..2ce958ff1ba7dfd9e649ca0a8c81d12b35689364
GIT binary patch
literal 256
zcmZSh4+acAx^@K&d<=|?a*WIkOJggzRv51ia9yg->*2BYeM6yt<AFwo#)hd3D-UdD
zxOjl2gu&obK~%$rh%SZz*%Af@xv)5f1q&8v1{f%qLPVq(7#RLCNL28*%Q0{%fB{hC
z4@0n{Z*ZueJ4A>viHSMjLrA=UJc}@^h=QV0Y+O<byBM>Oy@L)XJG&@*KsY-?dI&=^
zBLl-D2LH#b%#3-=JPZyDJ8Tpf8W@?FSst_TGCt)?NK8$8%Glj9fss+R;X;v&n1X<g
bY6IA1^O&p}BnmBb9U^pGp>74b0|o>Dsy9Lb

literal 0
HcmV?d00001

diff --git a/data/samsung-q800t-hdmi2.1 b/data/samsung-q800t-hdmi2.1
new file mode 100644
index 0000000000000000000000000000000000000000..92bff59342d9356db3536e09f0286e7797e55715
GIT binary patch
literal 256
zcmZSh4+acAx()>ld<=|?a*WIkOJggzRv51ia9yg->*2BYeM6yt<AFwo#)hd3D-UdD
zxOjl$1%tt-f~bZK5nT)cvLy@*a`}fC7A#m08epJc3K5ZFU|{&mAW^~pznp<f0Stg5
ze;9%teS<^&+#y1Yc}&ddA7T>)<XMDSMHCd3V&mcyQqz)B>>WzWZrwg~_{g#2I-Kn6
zqU-_T><sB449$!T438N6AG022%wy(ZaA25WqruR?$i&Q&dn5J;V?{$G69dCR6Yj@s
Zyo^uz86SL*f6Cb1GJz4R^MLM22LR`OPXPb`

literal 0
HcmV?d00001

diff --git a/data/samsung-q800t-hdmi2.1-game b/data/samsung-q800t-hdmi2.1-game
new file mode 100644
index 0000000000000000000000000000000000000000..0c17bf5b069b44fdf9b8be0567ec1a4e5c1324d7
GIT binary patch
literal 256
zcmZSh4+acAy7mPOd<=|?a*WIkOJggzRv51ia9yg->*2BYeM6yt<AFwo#)hd3D-UdD
zxOjl$1%tt-f~bZK5nT)cvLy@*a`}fC7A#m08epJc3K5ZFU|{&mAW^~pznp<f0Stg5
ze;9%teS<^&+#y1Y`Ap2EA7T>)<XMDSMHCd3V&mcyQqz)B>>WzWZrwg~_{g#2I-Kn6
zqU-_T><sB449$!T438N6AG022%wy(ZaA25WqruR?$i&Q&dn5J;V?{$GlR?En6Yj@s
fyo^uz86SL*f6Cb1GJ!D{=o}_Sg9@M%P{39I!EH<d

literal 0
HcmV?d00001

diff --git a/data/sharp-lc70uq17u-hdmi1 b/data/sharp-lc70uq17u-hdmi1
new file mode 100644
index 0000000000000000000000000000000000000000..06b517f842197a717d414db74e427a98f1904af4
GIT binary patch
literal 256
zcmZSh4+adr0{;aVfZ)FbBXh&7@Cq&IeTza(Hmiwv1+72Fu+m|ILt_IY957imNEBM=
zIz;HWGB774Gcd@dDF$o^WRNy+C@=#V0~7(`KMcVhjzIwm9xlF~TnY+6k-rS$KK$Nt
z3_u<TFq$$kn-zLZP*7rJVP;}yW7OniXBTA;uw_5c%*ep-n3b8akeP=;fMJJ?!h#e=
zCT2zl0f$En_KdO(cEv#Z>vUWjAoc@ABnoB36e4s~AugK7D9cb3ctK7fPa_oS#vZN<
RT?!9$1qAG-K|~}NqyPjAIspIx

literal 0
HcmV?d00001

diff --git a/data/sharp-lc70uq17u-hdmi2 b/data/sharp-lc70uq17u-hdmi2
new file mode 100644
index 0000000000000000000000000000000000000000..f829ac646bf787ccdb63abddb6f3d2ad08263b5c
GIT binary patch
literal 256
zcmZSh4+adr0{;aVfZ)FbBXh&7@Cq&IeTza(Hmiwv1+72Fu+m|ILt_IY957imNEBM=
zIz;HWGB774Gcd@dDF$o^WRNy+C@=#V0~7(`KMcVhjzIwm9xlF~TnY+6k-rS$KK$Nt
z3_u<TFq$$kn-zLZP*7rJVP;}yW7OniXBTA;uw_5c%*ep-n3b8akeP=;fnkS@!h#e=
zCT2zl0f$En_KdO(cEv#Z>vUWjAoc@ABnoB36e4s~AugK7D9cb3ctK7fPa_oS#vZN<
RT?!9$1qAG-K|~}NxBv;PIspIx

literal 0
HcmV?d00001

diff --git a/data/sharp-lc70uq17u-hdmi3 b/data/sharp-lc70uq17u-hdmi3
new file mode 100644
index 0000000000000000000000000000000000000000..99fba5fc76eff8cdd29247f39a206f3f7be11933
GIT binary patch
literal 256
zcmZSh4+adr0{;aVfZ)FbBXh&7@Cq&IeTza(Hmiwv1+72Fu+m|ILt_IY957imNEBM=
zIz;HWGB774Gcd@dDF$o^WRNy+C@=#V0~7(`KMcVhjzIwm9xlF~TnY+6k-rS$KK$Nt
z3_u<TFq$$kn-zLZP*7rJVP;}yW7OniXBTA;uw_5c%*ep-n3b8akeP?UfMJJ?!h#e=
zCT2zl0f$En_KdO(cEv#Z>vUWjAoc@ABnoB36e4s~AugK7D9cb3ctK7fPa_oS#vZN<
ST?!9$1qAG-K|~}NegOawOgjMp

literal 0
HcmV?d00001

diff --git a/data/sharp-lc70uq17u-hdmi4 b/data/sharp-lc70uq17u-hdmi4
new file mode 100644
index 0000000000000000000000000000000000000000..78d6c766a4f5dcd5824f71a4ac0c2a9dae5999a2
GIT binary patch
literal 256
zcmZSh4+adr0{;aVfZ)FbBXh&7@Cq&IeTza(Hmiwv1+72Fu+m|ILt_IY957imNEBM=
zIz;HWGB774Gcd@dDF$o^WRNy+C@=#V0~7(`KMcVhjzIwm9xlF~TnY+6k-rS$KK$Nt
z3_u<TFq$$kn-zLZP*7rJVP;}yW7OniXBTA;uw_5c%*ep-n3b8akeP?UfnkS@!h#e=
zCT2zl0f$En_KdO(cEv#Z>vUWjAoc@ABnoB36e4s~AugK7D9cb3ctK7fPa_oS#vZN<
ST?!9$1qAG-K|~}NUI73V>^lJf

literal 0
HcmV?d00001

diff --git a/data/sharp-lc70uq17u-vga b/data/sharp-lc70uq17u-vga
new file mode 100644
index 0000000000000000000000000000000000000000..e9177229a888b2d8247e1cf11d6179078e71f4ef
GIT binary patch
literal 128
zcmZSh4+adr0`39~K=5CLky(R*p+ZY~-=a{H&1xcELF>;ktaO;*(AdBT2TWEC5``AJ
z4iP%8AWaMma%qYI8v+@m4IB#0pdvu(FN3*{ytg0&mjW07MgA}ZdpHIKDEK(LfCL%%
E0msc90RR91

literal 0
HcmV?d00001

diff --git a/data/sony-gdmf520-vga b/data/sony-gdmf520-vga
new file mode 100644
index 0000000000000000000000000000000000000000..2d1aee7575bc45baf0127281d79596016df31b98
GIT binary patch
literal 128
zcmZSh4+adrH#e{`0)Yt^BNLy7+%#>TlMBM#XR8Z&`27Fh@X-Ha<jTm#nT3&wk*<-A
z{%y7l2Lc%k92^!1GqflRGBC(7FfjaOFjytmsmj2m00uyjKMd|JzPfIvMh0LppvZp)
PBXa`-Gjnr@B8GARL=z<e

literal 0
HcmV?d00001

diff --git a/data/sony-snyc901-override b/data/sony-snyc901-override
new file mode 100644
index 0000000000000000000000000000000000000000..8d5690bc304326c5332145b7b7f81054ba87e53e
GIT binary patch
literal 256
zcmZSh4+adrHyKYdf`Bk1bHjqD3NGH03&P!Js0(@cC~`0~Hh|^e1d~;RM4^SQLxhei
zgF{O)1A`o+EJIP?1v!O0jZmlv0|Ub!hG2icNQICvE(H((iu`3Tu;X*%XMhMOFg{^o
zHgyP+7f?`C5@8i)5fWr(5))--W7OniXBTA;2xVtzW@KQ<Vdh~_U}#`Cz`-FX_=v$0
zX#IsEp!EVet_^VO_XGj0-=Pue022W^QASK5LPr(ipm~h4KwUr)0UcF{u6Ya$2LVO2
BH~|0v

literal 0
HcmV?d00001

diff --git a/data/sony-snyd301-override b/data/sony-snyd301-override
new file mode 100644
index 0000000000000000000000000000000000000000..18a584420a393e25b0acb83fd12a2d57126ca127
GIT binary patch
literal 256
zcmZSh4+adrHyJN8f`Bk1bHjqD3NGH03&P!Js0(@cC~`1>Wsrz8#efZg4AKS;1!fEm
zEy)ZFa*VPJMS&OO6!J7ep&|?n41XAc{rw^pLc+KdKmaK6m%+e}&yAk}BA~$7%*1T!
z5F{_4pr|CmD$F7z$jl@r%Ff29$;r+x${rBP&d|)rz>vet!{ETsz;J+rLs0M$gC(PE
z!-XOlF$Dn~)dsNj^ME1}g+P%A9aV_+KoN#LK|lxX&<J&aIFZQ;sLMjvK|se9q6_Gr
F{Q!N4Hvs?u

literal 0
HcmV?d00001

diff --git a/data/sony-x900f-hdmi b/data/sony-x900f-hdmi
new file mode 100644
index 0000000000000000000000000000000000000000..2292fe8bec299a128ec5855a8b8b443e016a4650
GIT binary patch
literal 256
zcmZSh4+adrH(8n(K|qF)xgp24f{XX$f^hd4>OvkqiX04$4J!{6`fp|cs{j%lFBl9y
z6+|^`i0ERlO>$yjkYloHkSMg!b%@Y$g^DmRF#KT%_V<fa2nkbA&@wRK0*d@)5Vzy&
zuwmd*00YKJOw6etq7xHh<KmO#1w>edSrn9P?1aRa*#$+J*cemOba?C8McD&v+4qFA
zF*NftFyt}wFc>iGu+e8|U}R!uNxu<$gt4N5@in8{1qN5{hPH&V{znX_AG7{ve9F(v
ez`*vHjhB&8mZ2!{f}BF0MkvB@K-VxZ+yVe~nm_>n

literal 0
HcmV?d00001

diff --git a/data/vizio-e65e0-hdmi b/data/vizio-e65e0-hdmi
new file mode 100644
index 0000000000000000000000000000000000000000..2c2d878cfe7573dbfc0f9359adb8ea9192758148
GIT binary patch
literal 256
zcmZSh4+ad8RuTe?K)@iy$lTB$P@$ETyCl?qo;shq*V1zg7Y~5s5P+qG!QfLtRKtdd
zE(VVbCk6&NCaVUCLJM7o2pw0b2m=Gd9|l)5Q(ad>E(I_Eiu`2|_u=nRV}Ob<x-u~b
z7KX>C#3sch3n(ebE3&c(v$HWX2?~jdF&c%l0kuE@Cp)_+dq6WI14BMD4}$`Oh0TKK
dXodtvW|pUXiD?O`kJ<PcAG1DyDJPPC1pq`dE&%`l

literal 0
HcmV?d00001

diff --git a/data/vizio-m60c3-hdmi-onkyo-txnr555 b/data/vizio-m60c3-hdmi-onkyo-txnr555
new file mode 100644
index 0000000000000000000000000000000000000000..93369abc45fd4348188e5b3a3f285f38c27fe3b4
GIT binary patch
literal 256
zcmZSh4+adjrvn5SKtPI-xuMm&f~zxqVYKgJbwLkL1qOzT2N+QRO9_L)r-G=44G~=o
z2V{&G8046&8YBuWbR8meTp1ql2?9lcX8mCZiO}^6GBq{jQUC&=2*eH`0|FQ|nV3Bb
zycwC8Sy=5AV&mc;S##F2^VhSBvj^C-9q?sh2xnuAuVap{V@$7SZ1!hh$YthX2xZt|
yqri{=)b)rjG5tpD5ypxJ29^?-145w=V3cJj3cMhvkf#yK;IIW~GssD3pbG#y;WhyP

literal 0
HcmV?d00001

-- 
2.24.3 (Apple Git-128)

